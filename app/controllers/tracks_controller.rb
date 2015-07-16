class TracksController < ApplicationController
  before_action :redirect_unless_logged_in

  def new
    @track = Track.new
    @track.album_id = params[:album_id]
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to new_album_track_url(params[:track][:album_id])
    end
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def index
    @tracks = Track.all
    render :index
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(Track_params)
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to edit_track_url
    end
  end

  def destroy
    @track = Track.find(params[:id])
    if @track.destroy
      redirect_to tracks_url
    else
      flash[:errors] = ["You can't destroy that!"]
      redirect_to track_url(@track)
    end
  end

  private

  def track_params
    params.require(:track).permit(:name, :album_id, :is_bonus, :lyrics)
  end
end
