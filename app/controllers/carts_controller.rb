class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
   before_action :set_customer

  # GET /carts
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  def show
   @customer = current_customer
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  def create
    @cart = Cart.new(cart_params)
    
    if @cart.save
      redirect_to @cart, notice: 'Cart was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /carts/1
  def update
    if @cart.update(cart_params)
      redirect_to @cart, notice: 'Cart was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /carts/1
  def destroy 
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    @cart_items = current_customer.cart_items
    @cart_items.each do |item|
       @video = Video.find(item.video_id) 
       @quantity = item.quantity
       item.destroy
       @available_stock = @video.stock + @quantity
       @video.update(:stock => @available_stock) 
    end
	#	@cart_items = current_cart.cart_items

    redirect_to cart_list_show_path, notice: 'Cart was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.fetch(:cart, {}).permit(:customer_id)
    end


    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to root_path, notice: "That cart doesn't exist"
    end


 def set_customer
   params[:customer_id] = current_customer.id
  end
end
