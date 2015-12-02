class JournalsController < ApplicationController
before_action :authenticate_user!
  def index
    @box = Box.find(params[:box_id])
    @jrnl4box = @box.journals
  end

  def show #can this be done differently?
    @box = Box.find(params[:box_id])
    @journal = Journal.find(params[:id])
  end

  def new
    @box = Box.find(params[:box_id])
    @journal = Journal.new
  end

  def create
    @box = Box.find(params[:box_id])
    @journal = Journal.new(params.require(:journal).permit(:title, :entry))
    @journal.box = @box
    if @journal.save
      flash[:notice] = "You successfully started your Journal"
      redirect_to box_journals_path
    else
      flash[:error] = "We had a problem starting your journal. Please try again."
      render :new
    end
  end

  def edit
    @box = Box.find(params[:box_id])
    @journal = Journal.find(params[:id])
  end

  def update
    @box = Box.find(params[:box_id])
    @journal = Journal.find(params[:id])
    if @journal.update_attributes(params.require(:journal).permit(:title, :entry))
      flash[:notice] = "You have updated your journal successfully"
      redirect_to box_journals_path
    else
      flash[:error] = "We had a problem updating your journal. Please try again."
      render :edit
    end
  end
end
