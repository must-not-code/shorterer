Rails.application.routes.draw do
  root 'short_urls#new'

  match '/urls', to: 'short_urls#create', via: :post
  match '/urls/:short_url', to: 'short_urls#view', via: :get, as: 'short_url'
  match '/urls/:short_url/stats', to: 'short_urls#show', via: :get
end
