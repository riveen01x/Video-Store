class ReviewsController < ApplicationController
  before_action :find_video
  before_action :authenticate_customer
  before_action :find_review, only: [:edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  def new
    @review = Review.new 
  end
   
  def create
    @review = Review.new(review_params)
    @review.video_id = @video.id
    @review.customer_id = current_customer.id
    @review.customer_email = current_customer.email
    respond_to do |format|
       if @review.save
         format.html { redirect_to video_path(@video) }
         format.js
       else
         format.html { render :new }
         format.js
       end
    end
  end

  def edit
  end
  
  def update
    if @review.update(review_params)
      redirect_to video_path(@video)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    redirect_to video_path(@video)
  end


  private

   def review_params
      params.require(:review).permit(:rating, :comment)
   end


   def find_video
     @video = Video.find(params[:video_id])
   end
  
   def find_review
    @review = Review.find(params[:id]) 
   end
  

   def authenticate_customer
     if !customer_signed_in?
       redirect_to new_customer_session_path, notice: "Please log in."
     end
   end


end
