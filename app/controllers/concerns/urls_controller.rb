class UrlsController < ApplicationController
  include ApplicationHelper

  def create
    url = Url.new(create_params)
    if url.save
      current_user.urls << url
      redirect_to user_path(current_user.id)
    else
      redirect_to user_path(current_user.id)
    end
  end

  def redirect
    url = Url.find_by_short_url(params[:short_url])
    redirect_to(url.full_url)
  end


  private
    def create_params
      params.require(:url).permit(:full_url)
    end
end
