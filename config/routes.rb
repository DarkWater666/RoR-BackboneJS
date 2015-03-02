Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  constraints subdomain: 'www' do
    get ':any', to: redirect(subdomain: nil, path: '/%{any}'), any: /.*/
  end

  root 'home#index'

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'registration', edit: 'admin/:id' }

  scope '/admin' do
    get '/', to: 'admin#index', as: 'admin_root'
  end

end
