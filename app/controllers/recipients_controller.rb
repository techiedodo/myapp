class RecipientsController < ApplicationController
before_action :authenticate_user!
  def create
    @box = Box.find(params[:box_id])
    @recipient = Recipient.new(params.require(:recipient).permit(:recipient, :email, :DOB))
    @recipient.user = current_user
    @recipient.box = @box
    if @recipient.save
      #flash[:notice] = "You successfully entered your recipient"
      redirect_to [@box]
    else
      flash[:error] = "We had trouble entering your recipient. Please try again."
      redirect_to [@box]
    end
  end

  def show
  end

  def destroy
    @box = Box.find(params[:box_id])
    @recipient = @box.recipients.find(params[:id])

    if @recipient.destroy
      flash[:notice] = "\"#{@recipient.recipient}\" was removed successfully."
      redirect_to @box
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end
  end
end
