Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'index#home'

  namespace :v1 do
    resources :cloudflare_users, :path => 'CloudflareUser'
    resources :cloudflare_domains, :path => 'CloudflareDomain'
    resources :cloudflare_domain_details, :path => 'CloudflareDomainDetail'
    resources :contents, :path => 'Content'
    resources :airplanes, :path => "Airplane"
    resources :count_clicks, :path => "ContentDetail"

    ## API Count Click 
    # get 'ContentDetail' => 'count_clicks#index'
    get 'showContentDetail' => 'count_clicks#show'
  end
end
