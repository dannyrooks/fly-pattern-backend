Rails.application.routes.draw do
  
  # resources :materials

  resources :patterns do 
    resources :materials
  end
  
end
