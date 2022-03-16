class VideosController < ApplicationController

  load_and_authorize_resource
  before_action :initialize_search, only: :index
  before_action :initialize_session
  before_action :increment_visit_count, only: :index
 # before_action :load_cart
  #before_action :load_customer
  
  # GET /videos
  def index
    @rent_item = current_rent.rent_items.new
   # @cart_item = current_cart.cart_items.new
    @videos = Video.paginate(page: params[:page], per_page: 4)
    @recent_videos = Video.all.order('created_at DESC').limit(4).offset(1)
    @videos = Video.search(params[:search]).paginate(page: params[:page], per_page: 4) 
    @genres = Genre.all
    handle_filters
    #@cart = Cart.find(session[:cart_id])
  end


 # def add_to_cart
   # if customer_signed_in?
   #   id = params[:id].to_i
   #   session[:cart] << id unless session[:cart].include?(id)
   #   redirect_to root_path
   #  else
   #   redirect_to new_customer_session_path
   # end

 # end


  #def remove_from_cart
   # id = params[:id].to_i
   # session[:cart].delete(id)
  #  redirect_to videos_cart_path
  #end

  # GET /videos/1
  def show

    if customer_signed_in?
     #@rent_item = current_customer.rent_items.new 
    end
    @customer = current_customer if customer_signed_in?
    @categories = Category.all.map{ |c| [c.name, c.id] } 
    @cart_item = current_cart.cart_items.new
    if @video.genres.empty?
      @associated_genres = 'None'
    else
      @associated_genres = @video.genres.map(&:name).join("/ ")
    end
    if customer_signed_in?
     @cart_items = current_customer.cart_items.to_a
    end

   @waitlists = Waitlist.all
   
   @waitlist = Waitlist.new
 
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end


  # POST /videos
  def create
    @video.user_id = current_user.id
    if @video.save
      user = @video.user
      redirect_to @video, notice: 'Video was successfully created.'
      CustomerMailer.new_video(user, @video).deliver_now
      sleep 2
    else
      render :new
    end
  end

  # PATCH/PUT /videos/1
  def update
    if @video.update(video_params)
      redirect_to @video, notice: 'Video was successfully updated.'
      if @video.stock > 0
        @waitlists = Waitlist.all
        @waitlists.each do |waitlist|
          if waitlist.video_id == @video.id
            email = waitlist.email
            video = Video.find(waitlist.video_id)
            WaitlistsMailer.stock_available(email, video).deliver_now
            waitlist.destroy
          end
        end
      end
    else
      render :edit
    end
  end

  # DELETE /videos/1
  def destroy

    @video = Video.find(params[:id])
    @video.destroy
    redirect_to videos_url, notice: 'Video was successfully destroyed.'
  end

  def autocomplete
    render json: Video.search(params[:query], {
      fields: ["name^5"],
      match: :word_start,
      limit: 10,
      load: false,
      misspellings: {below: 5} 
    }).map(&:name)
  end


  def rent_form
    @rent_item = current_rent.rent_items.new
    @video = Video.find(params[:video_id])

    @categories = Category.all.map{ |c| [c.name, c.id] } 
   # @video.category_id = params[:category_id]
    @category_id = params[:category_id]

  end

  def clear_cart
    session[:cart] = [] 
    redirect_to videos_cart_path
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def video_params
      params.require(:video).permit(:name, :description, :thumbnail, :rent_price, :user_id, :stock, :dvd_copies, :vhs_copies, :bluray_copies, :genre_ids => [], :actor_ids=>[])
    end

  def initialize_search
    params[:search]
    params[:filter]
    params[:filter_option] = nil if params[:filter_option] == ""
    params[:filter_option]
  end

  def handle_search_name
    if params[:search]
      @videos = Video.where("name like ?", "%#{params[:search].titleize}%")
      
      @genres = @genres.where(id: @videos.pluck(:genre))
    end
  end

  def handle_filters
    if params[:filter_option] && params[:filter] == "genre"
      @genres = @genres.where(id: params[:filter_option])
    end
  end

  def initialize_session
    session[:visit_count] ||= 0 unless current_customer.nil?
    session[:customer_id] ||= current_customer.id if customer_signed_in?
    session[:cart] ||= [] 
    session[:quantity] = 1
  end

  def load_cart
   @cart = Video.find(session[:cart]) 
  end
 

  def load_customer
    @customer = Customer.find(session[:customer_id]) if customer_signed_in?
  end

  def increment_visit_count
    session[:visit_count] += 1 unless current_customer.nil?
    @visit_count = session[:visit_count]
  end

end
