class UserController < ApplicationController
  skip_before_action  :verify_authenticity_token

  def create
    user = User.create(first_name: params[:first_name],
      last_name: params[:last_name],
      proffesion: params[:proffesion])
    user.valid? ? user.save : puts("ERROR: INVALID USER")
  end

end
