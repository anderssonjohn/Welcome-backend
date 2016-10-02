class MatchingController < ApplicationController
  before_action :authenticate

  def get_match
    render :json => @user
  end
end
