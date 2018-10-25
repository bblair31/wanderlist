class PhotosController < ApplicationController

  def edit
    @photo = Photo.find_by(user_id: session[:user_id])
  end

  def update
    @photo = Photo.find_by(user_id: session[:user_id])
    @photo.update(photo_params)
    redirect_to user_path(session[:user_id])
  end

private

  def photo_params
    params.require(:photo).permit(:url, :user_id)
  end

end ### End of PhotosController
