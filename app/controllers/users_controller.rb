class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_search, only: :index
  load_and_authorize_resource


  
  # GET /users
  def index
    handle_search_name
    handle_filters
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename='users.xlsx'"
      }
      format.html { render :index}
    end
  end


  def clear
    clear_session(:search_name, :filter_name, :filter)
    redirect_to users_path
  end


  # GET /users/1
  def show
    @joined_on = @user.created_at.to_formatted_s(:short)

    if @user.current_sign_in_at
      @last_login = @user.current_sign_in_at.to_formatted_s(:short)
    else
      @last_login = 'never'
    end
  end

  # GET /users/new
  def new
  end

  # GET /users/1/edit
  def edit
  end

  def edit_profile
  
   @user = current_user
  end

  # POST /users
  def create

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    successfully_updated = if needs_password?(@user, user_params)
                              @user.update(user_params)
                           else
                              @user.update_without_password(user_params)
                            end

    if successfully_updated
      redirect_to @user, notice: "User was successfully updated."
    else
      render 'edit'
    end

  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(
        :email,
        :password,
        :password_confirmation,
        :first_name,
        :last_name,
        :role_id
        )
    end

    def needs_password?(_user, params)
      params[:password].present?
    end


  def initialize_search
    @roles = Role.all
    session[:search_name] ||= params[:search_name]
    session[:filter] = params[:filter]
    params[:filter_option] = nil if params[:filter_option] == ""
    session[:filter_option] = params[:filter_option]
  end

  def handle_search_name
    if session[:search_name]
      @users = User.where("first_name like ? OR last_name like ?", "%#{session[:search_name].titleize}%", "%#{session[:search_name].titleize}%")
     # @roles = @roles.where(id: @users.pluck(:role))
    else
      @users = User.all.order('first_name ASC')
    end
  end

  def handle_filters
    if session[:filter_option] && session[:filter] == "role"
      @roles = @roles.where(id: session[:filter_option])
    end
  end
end
