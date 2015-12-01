class BoxesController < ApplicationController
before_action :authenticate_user!
  def index
    @boxes = policy_scope(Box)
    authorize @boxes
  end

  def show
    @box = Box.find(params[:id])
    @recipient = Recipient.new
    @recipients = @box.recipients
  end

  def new
    @box = Box.new
    authorize @box
  end

  def create
  @box = Box.new(params.require(:box).permit(:title, :description))
  @box.user = current_user #this allows us to create user-specific boxes
  authorize @box
    if @box.save
      flash[:notice] = "You successfully built your first trove. Time to fill it with memories."
      redirect_to @box
    else
      flash[:error] = "We were not able to build your trove successfully. Please try again."
      render :new
    end
  end

  def edit
    @box = Box.find(params[:id])
  end

  def update
    @box = Box.find(params[:id])
    if @box.update_attributes(params.require(:box).permit(:title, :description))
      flash[:notice] = "You have update your trove successfully."
      redirect_to @box
    else
      flash[:error] = "We have encountered a problem updating your trove. Please try again."
      render :edit
    end
  end

  def destroy
    @box = Box.find(params[:id])

    if @box.destroy
      flash[:notice] = "\"#{@box.title}\" was removed successfully."
      redirect_to boxes_path
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end
  end

end
