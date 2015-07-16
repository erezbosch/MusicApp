class AlbumsController < ApplicationController
  before_action :redirect_unless_logged_in

  def new
    @album = Album.new
    @album.band_id = params[:band_id]
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to new_band_album_url(params[:album][:band_id])
    end
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def index
    @albums = Album.all
    render :index
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to edit_album_url
    end
  end

  def destroy
    @album = Album.find(params[:id])
    if @album.destroy
      redirect_to albums_url
    else
      flash[:errors] = ["You can't destroy that!"]
      redirect_to album_url(@album)
    end
  end

  private

  def album_params
    params.require(:album).permit(:name, :band_id, :is_live)
  end
end
