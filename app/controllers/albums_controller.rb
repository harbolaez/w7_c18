class AlbumsController < ApplicationController
  before_action :authorize
  before_action :set_album, except: [:index]

  skip_before_action :verify_authenticity_token, only: [:destroy]

  def index
    @albums = current_user.albums.all
    respond_to do |format|
      format.html { render 'index', layout: !(params[:is_ajax].present?) }
    end
  end

  def show
    @photos = @album.photos
    respond_to do |format|
      format.html { render 'show', layout: !(params[:is_ajax].present?) }
    end
  end

  def new
    @album = Album.new
  end

  def create
    album = current_user.albums.build(album_params)
    # a = Album.new(album_params)
    # a.user_id = current_user.id
    if album.save
      redirect_to root_path
    else
      redirect_to new_album_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @album.destroy
    render json: { is_success: true }
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
