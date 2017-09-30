class AlbumsController < ApplicationController
  before_action :authorize
  before_action :set_album, except: [:index]

  def index
    @albums = current_user.albums.all
  end

  def show
    @photos = @album.photos
  end

  def new
    @album = Album.new
  end

  def create
    album = current_user.albums.build(album_params)
    if album.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def album_params
      params.require(:album).permit(:title, :caption)
    end

    def set_album
      if params[:id].present?
        @album = Album.find(params[:id])
      end
    end
end
