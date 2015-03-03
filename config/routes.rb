Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  constraints subdomain: 'www' do
    get ':any', to: redirect(subdomain: nil, path: '/%{any}'), any: /.*/
  end

  root 'home#index'

  devise_for :users, :skip => ['registrations', 'passwords'], path: '', path_names: { sign_in: 'login', sign_out: 'logout', edit: 'admin/:id' }

  #####################################################################  ADMIN  ###################################################################################################

  scope '/admin' do

    get '/', to: 'admin#index', as: 'admin_root'
    get '/registrations_fancy', to: 'home#registrations_fancy', as: 'registrations_fancy'

    as :user do
      get '/', :to => 'admin#index', :as => :user_root
      get 'profile' => 'devise/registrations#edit', :as => 'edit_user'
      put 'users' => 'devise/registrations#update', :as => 'update_user'
    end

  end

  #####################################################################  ERRORS  ###################################################################################################

  match '/not_found', via: :all, to: 'errors#not_found', as: 'not_found'
  match '/unprocessable_entity', via: :all, to: 'errors#unprocessable_entity', as: 'unprocessable_entity'
  match '/server_error', via: :all, to: 'errors#server_error', as: 'server_error'
  match '/bad_gateway', via: :all, to: 'errors#bad_gateway', as: 'bad_gateway'
  get '*unmatched_route', to: 'errors#not_found'

end
