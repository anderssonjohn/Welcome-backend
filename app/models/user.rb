require 'securerandom'
class User < ApplicationRecord
  before_create :set_auth_token

  has_many :conversations, :foreign_key => :sender_id

  scope :different_language, -> (user) do
    where("users.swedish_speaker ")
  end

  scope :same_job, -> (user) do
    where("conversations.sender_id =? OR conversations.recipient_id =?",user.id,user.id)
  end

  private

  def set_auth_token
    return if auth_token.present?
    self.auth_token = generate_auth_token
  end

  def generate_auth_token
    SecureRandom.uuid.gsub(/\-/,'')
  end

end
