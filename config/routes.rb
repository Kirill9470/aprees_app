Rails.application.routes.draw do
  root 'posts#index'

  post '/create_root_post', to: 'posts#create_root_post'
  post '/:name', to: 'posts#create'
  put '/:name', to: 'posts#update'
  delete '/:name', to: 'posts#destroy'
  get '/new_root_post', to: 'posts#new_root_post'

  get '/:name/edit', to: 'posts#edit'
  get '/:name/new', to: 'posts#new'
  get '/:name', to: 'posts#show'

  post '*parent_names/:name', to: 'posts#create'
  put '*parent_names/:name', to: 'posts#update'
  delete '*parent_names/:name', to: 'posts#destroy'

  get '*parent_names/:name/edit', to: 'posts#edit'
  get '*parent_names/:name/new', to: 'posts#new'
  get '*parent_names/:name', to: 'posts#show'
end