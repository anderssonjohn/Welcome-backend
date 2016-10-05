class ConversationsController < ApplicationController
  before_action :authenticate


  def get
    conversation = Conversation.involving(@user)
    render :json => conversation.to_json(:methods => :name)
  end



  def get_messages
    # :id is the id of the recipient
    conversation = Conversation.between(@user.id, params[:id]).first
    render :json => conversation.messages
  end


  private


  def interlocutor(conversation)
    @current_user == conversation.recipient ? conversation.sender : conversation.recipient
  end
end
