class RepliesController < ApplicationController
  before_action :set_reply, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  # GET /replies
  def index
    @replies = Reply.all
  end

  # GET /replies/1
  def show
  end

  # GET /replies/new
  def new
    @reply = Reply.new
  end

  # GET /replies/1/edit
  def edit
  end

  # POST /replies
  def create
    @reply = Reply.new(reply_params)
    @reply.customer_id = current_customer.id unless !customer_signed_in? 
    @reply.user_id = current_user.id unless !user_signed_in?

    if !@reply.customer_id.nil?
       @customer = Customer.find(@reply.customer_id)
       @reply.customer_email = @customer.email
    elsif !@reply.user_id.nil?
       @user = User.find(@reply.user_id)
       @reply.user_email = @user.email
    end
    @reply.save

    @time_left = Time.now - @reply.created_at
    @time_expire = @reply.created_at + 1.minute

    if @reply.save
      @video = @reply.review.video
      redirect_to video_path(@video), notice: 'Reply was successfully sent.'
    else
      render :new
    end

  end

  # PATCH/PUT /replies/1
  def update
    if @reply.update(reply_params)
      redirect_to @reply, notice: 'Reply was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /replies/1
  def destroy
    @reply.destroy
    redirect_to replies_url, notice: 'Reply sent undone!.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reply_params
      params.require(:reply).permit(:content, :review_id, :customer_id, :user_id)
    end

    def authorize
       redirect_to new_customer_session_path, notice: "Please log in to add a review!"  unless customer_signed_in? || user_signed_in?
    end
end
