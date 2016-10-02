class UsersController < ApplicationController
  before_action :authenticate, only: :show

  def show
    render :json => @user
  end

  def create
    user = User.new(name: params[:name],
      profession: params[:profession],
      swedish_speaker: params[:swedish_speaker],
      gender: params[:gender],
      date_of_birth: params[:date],
      interest: params[:interest])
    if user.valid?
      user.save
      render :json => user
    else
      render status: 406
    end
  end

  # protected


  # def authenticate
  #   authenticate_or_request_with_http_token do |token, options|
  #     @user = User.find_by(auth_token: token)
  #   end
  # end

end
