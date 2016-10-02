class MessagesController < ApplicationController
  # include MessagesHelper
  before_action :authenticate

  def create
    @conversation = Conversation.find(params[:conversation_id])
    # @user comes from authen
    @message = @conversation.messages.build(body: params[:body], user: @user)

    @message.save!

    render status: 200

  end

  private

  # def authenticate
  #   @user = ApplicationController.authenticate
  # end

  # def message_params
  #   params.require(:message).permit(:body)
  # end

  # def self_or_other(message)
  #   message.user == current_user ? "self" : "other"
  # end

  # def message_interlocutor(message)
  #   message.user == message.conversation.sender ? message.conversation.sender : message.conversation.recipient
  # end

end
