class EntriesController < ApplicationController
  def index
    @journal = Journal.find(params[:journal_id])
    #@entries = Entry.all
    @entrys = @journal.entries
  end

  def show
    @journal = Journal.find(params[:journal_id])
    @entry = Entry.find(params[:id])
  end

  def new
    @journal = Journal.find(params[:journal_id])
    @entry = Entry.new
  end

  def create
    @journal = Journal.find(params[:journal_id])
    @entry = Entry.new(params.require(:entry).permit(:subject, :body))
    @entry.journal = @journal
      if @entry.save
        flash[:notice] = "You have successfully saved your journal entry."
        redirect_to [@journal, @entry]
      else
        flash[:error] = "We were not able to save your journal entry. Please try again."
        render :new
      end
  end

  def edit
    @journal = Journal.find(params[:journal_id])
    @entry = Entry.find(params[:id])
  end

  def update
    @journal = Journal.find(params[:journal_id])
    @entry = Entry.find(params[:id])
    if @entry.update_attributes(params.require(:entry).permit(:subject, :body))
      flash[:notice] = "You have updated your entry successfully."
      redirect_to @entry
    else
      flash[:error] = "We have encountered a problem updating your entry. Please try again."
      render :edit
    end
  end

  def destroy
    @journal = Journal.find(params[:box_id])
    @entry = Entry.find(params[:id])

    if @entry.destroy
      flash[:notice] = "Your entry was removed successfully."
      redirect_to box_journals_path
    else
      flash[:error] = "There was an error deleting the journal. Please try again."
      render :show
    end
  end
end
