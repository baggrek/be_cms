Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'index#home'

  namespace :v1 do
    resources :cloudflare_users, :path => 'CloudflareUser'
    resources :cloudflare_domains, :path => 'CloudflareDomain'
    resources :cloudflare_domain_details, :path => 'CloudflareDomainDetail'

    ## Cloudflare Sub Domain
    # get 'allCloudflareDomainDetail' => 'cloudflare_domain_details#index'
    # post 'create/CloudflareDomainDetail' => 'cloudflare_domain_details#create'
    # put 'update/CloudflareDomainDetail' => 'cloudflare_domain_details#update'
    # delete 'delete/CloudflareDomainDetail' => 'cloudflare_domain_details#destroy'
    # get 'show/CloudflareDomainDetail' => 'cloudflare_domain_details#show'
  end
end
