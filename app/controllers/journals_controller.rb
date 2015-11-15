class JournalsController < ApplicationController
  def index
    @journals = Journal.all
  end

  def show
    @journal = Journal.find(params[:id])
  end

  def new
    @journal = Journal.new
  end

  def create
    @journal = Journal.new(params.require(:journal).permit(:title, :entry))
    if @journal.save
      flash[:notice] = "You successfully started your Journal"
      redirect_to @journal
    else
      flash[:error] = "We had a problem starting your journal. Please try again."
      render :new
    end
  end

  def edit
    @journal = Journal.find(params[:id])
  end

  def update
    @journal = Journal.find(params[:id])
    if @journal.update_attributes(params.require(:journal).permit(:title, :entry))
      flash[:notice] = "You have undated your journal successfully"
      redirect_to @journal
    else
      flash[:error] = "We had a problem updating your journal. Please try again."
      render :edit
    end
  end
end
