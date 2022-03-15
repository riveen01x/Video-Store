class WaitlistsController < ApplicationController
  before_action :set_waitlist, only: [:show, :edit, :update, :destroy]



  # GET /waitlists
  def index
    @waitlists = Waitlist.all
  end

  # GET /waitlists/1
  def show
  end

  # GET /waitlists/new
  def new
    @waitlist = Waitlist.new
  end

  # GET /waitlists/1/edit
  def edit
  end

  # POST /waitlists{
  def create
    @waitlist = Waitlist.new(waitlist_params)
    @video = Video.find(@waitlist.video_id)

  if @waitlist.valid?
   @waitlist.save
     redirect_to video_path(@video), :notice => 'Added to waitlist!'
  else
   flash[:error] = "You have already joined this waitlist!"
   redirect_to video_path(@video)
  end


  end

  # PATCH/PUT /waitlists/1
  def update
    if @waitlist.update(waitlist_params)
      redirect_to @waitlist, notice: 'Waitlist was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /waitlists/1
  def destroy
    @waitlist.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_waitlist
      @waitlist = Waitlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def waitlist_params
      params.require(:waitlist).permit(:email, :video_id)
    end
end
