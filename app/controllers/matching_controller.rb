class MatchingController < ApplicationController
  before_action :authenticate

  def get_match
    # create(@user.id,find_match)
    render :json => @user
  end

  def create(sender_id, recipient_id)
    if Conversation.between(sender_id,recipient_id).present?
      @conversation = Conversation.between(sender_id,recipient_id).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

    render json: { conversation_id: @conversation.id }
  end

  def show
    @conversation = Conversation.find(params[:id])
    @reciever = interlocutor(@conversation)
    @messages = @conversation.messages
    @message = Message.new
    render :json => @conversation.messages
  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

  def find_match
    2
  end

end
