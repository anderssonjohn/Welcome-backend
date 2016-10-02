require 'securerandom'
class User < ApplicationRecord
  before_create :set_auth_token

  has_many :conversations, :foreign_key => :sender_id

  private

  def set_auth_token
    return if auth_token.present?
    self.auth_token = generate_auth_token
  end

  def generate_auth_token
    SecureRandom.uuid.gsub(/\-/,'')
  end

end
