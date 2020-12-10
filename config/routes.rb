Rails.application.routes.draw do
  
  resources :patterns do 
    resources :materials
  end

  
  # resources :materials

end
