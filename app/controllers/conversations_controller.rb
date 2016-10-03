class ConversationsController < ApplicationController
  before_action :authenticate

  def get
    render :json => Conversation.involving(@user)
  end

  def get_messages
    conversation = Conversation.find(params[:id])
    render :json => conversation.messages
  end


  private


  def interlocutor(conversation)
    @current_user == conversation.recipient ? conversation.sender : conversation.recipient
  end
end
