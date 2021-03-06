Rails.application.routes.draw do
  #HerokuでReact Routerを使用するための設定
  #get '*path', to: "application#fallback_index_html", constraints: ->(request) do
  #  !request.xhr? && request.format.html?
  #end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :restaurants do
        resources :foods, only: %i[index]
      end
      resources :line_foods, only: %i[index create]
      put 'line_foods/replace', to: 'line_foods#replace'
      resources :orders, only: %i[create]
      resources :recipes
    end
  end
  get '*path', to: "application#fallback_index_html", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
end
