class UserController < ApplicationController
  #skip_before_action  :verify_authenticity_token

  def create
    user = User.create(first_name: params[:first_name],
      last_name: params[:last_name],
      proffesion: params[:proffesion])
    if user.valid?
      render plain: :ok
      user.save
    else
      render plain: :not_found
      puts("ERROR")
    end
  end

  def show
      user = User.find(params[:id])

      render :json => user
  end

end
