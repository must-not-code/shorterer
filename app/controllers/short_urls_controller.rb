class ShortUrlsController < ApplicationController
  before_action :short_url, only: [:show, :view]

  def new
  end

  def create
    @short_url = ShortUrl.new(url: params[:url])
    if @short_url.save
      render json: { short_url: short_url_url(@short_url.slug) }
    else
      render json: { error: @short_url.errors.full_messages.join(', ') }
    end
  end

  def show
  end

  def view
    if @short_url.present?
      View.create(
        short_url_id: @short_url.id,
        platform: browser.platform.name,
        device: browser.device.name,
        country: nil
      )
      redirect_to @short_url.url
    else
      render '_not_found'
    end
  end

  def short_url
    @short_url = ShortUrl.find_by_slug(params[:short_url])
  end
end
