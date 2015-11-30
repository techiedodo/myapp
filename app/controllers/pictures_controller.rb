class PicturesController < ApplicationController
before_action :authenticate_user!
  def index
    @box = Box.find(params[:box_id])
    @pictures = @box.pictures
  end

  def show
    @box = Box.find(params[:box_id])
    @picture = Picture.find(params[:id])
  end

  def new
    @box = Box.find(params[:box_id])
    @picture = Picture.new
  end

  def create
    @box = Box.find(params[:box_id])
    @picture = Picture.new(params.require(:picture).permit(:caption, :photo))
    @picture.box = @box
    if @picture.save
      flash[:notice] = "You successfully uploaded your photo."
      redirect_to [@box, @picture]
    else
      flash[:error] = "We had a problem uploading your photo. Please try again."
      render :new
    end
  end

  def edit
    @box = Box.find(params[:box_id])
    @picture = Picture.find(params[:id])
  end

  def destroy
    @box = Box.find(params[:box_id])
    @picture = @box.pictures.find(params[:id])

    if @picture.destroy
      flash[:notice] = "\"#{@picture.caption}\" was removed successfully."
      redirect_to box_pictures_path
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end
  end
end
