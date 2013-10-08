class UrlsController < ApplicationController
  def create
    url = Url.new(params[:url])
    if url.save
      redirect_to user_path(current_user.id)
    else
      redirect_to user_path(current_user.id)
    end

  end
end
