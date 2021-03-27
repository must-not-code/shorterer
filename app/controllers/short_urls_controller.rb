class ShortUrlsController < ApplicationController
  before_action :short_url, only: [:show, :view]

  def new
  end

  def create
  end

  def show
  end

  def view
    if @short_url.present?
      View.create(short_url_id: @short_url.id)
      redirect_to @short_url.url
    else
      render '_not_found'
    end
  end

  def short_url
    @short_url = ShortUrl.find_by_slug(params[:short_url])
  end
end
