class PhotosController < ApplicationController
  before_action :set_album, except: [:index]
  before_action :set_photo, except: [:index]

  skip_before_action :verify_authenticity_token, only: [:destroy]


  def index
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def create
    photo = @album.photos.build(photo_params)
    if photo.save
      redirect_to @album
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @photo.destroy
    render json: { is_success: true }
  end

  private
    def photo_params
      params.require(:photo).permit(:title, :picture, :caption)
    end

    def set_album
      @album = Album.find_by_id(params[:album_id])
    end

    def set_photo
      @photo = @album.photos.find_by_id(params[:id])
    end
end