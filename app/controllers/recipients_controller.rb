class RecipientsController < ApplicationController
before_action :authenticate_user!
  def create
    @box = Box.find(params[:box_id])
    @recipient = Recipient.new(recipient_params)

    user
    user_search = User.where(email: recipient_params[:email])
    if user_search.count == 0
      user = User.new(
        name:     recipient_params[:name],
        email:    recipient_params[:email],
        password: recipient_params[:DOB].strftime("%m%e%y")
      )
      user.save!
    else
      user = user_search.first
    end
    @recipient.user = user
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

  def send_recipient_confirmation
    @recipient = Recipient.find(params[:id])
    @box = @recipient.box

    RecipientMailer.recipient_confirmation(@recipient).deliver
    flash[:notice] = "Confirmation sent to #{@recipient.recipient}."
    redirect_to @box
  end

  private

  def recipient_params
    params.require(:recipient).permit(:recipient, :email, :DOB)
  end
end
