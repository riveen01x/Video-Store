class UsersController < ApplicationController
  before_action :authenticate_customer!

  # GET /customers
  def index
  end

  # GET /customers/1
  def show
   @customer = customer.find(params[:id])
  end

  # GET /customers/new
  def new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  def create

    if @customer.save
      redirect_to @customer, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /customers/1
  def update
    if customer_params[:password].blank?
      customer_params.delete(:password)
      customer_params.delete(:password_confirmation)
    end

    successfully_updated = if needs_password?(@customer, customer_params)
                              @customer.update(customer_params)
                           else
                              @customer.update_without_password(customer_params)
                            end

    if successfully_updated
      redirect_to @customer, notice: "User was successfully updated."
    else
      render 'edit'
    end

  end

  # DELETE /customers/1
  def destroy
    @customer.destroy
    redirect_to customers_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(
        :email,
        :password,
        :password_confirmation,
        )
    end

    def needs_password?(_customer, params)
      params[:password].present?
    end

end
