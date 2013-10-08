class UrlsController < ApplicationController
  def create
    url = Url.new(create_params)
    if url.save
      redirect_to user_path(current_user.id)
    else
      redirect_to user_path(current_user.id)
    end

  end


  private
    def create_params
      params.require(:url).permit(:full_url)
    end
end
