class MatchingController < ApplicationController
  before_action :authenticate

  def get_match
    # create(@user.id,find_match)
    create(@user.id, User.find(rand(1..@user.id-1)).id)
    render :json => @conversation
  end

  def create(sender_id, recipient_id)
    puts sender_id
    puts recipient_id
    if Conversation.between(sender_id,recipient_id).present?
      @conversation = Conversation.between(sender_id,recipient_id).first
    else
      @conversation = Conversation.create!(sender_id: sender_id, recipient_id: recipient_id)
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
    @reciever = interlocutor(@conversation)
    @messages = @conversation.messages
    @message = Message.new
    render :json => @conversation.messages
  end

  private


  def find_match
    2
  end

end
