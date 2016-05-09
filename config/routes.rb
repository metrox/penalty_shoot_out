Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :penalty do
        post :create, to: "penalty#create"
        post :shoot, to: "penalty#shoot"
        post :save, to: "penalty#save"
      end
    end
  end
end
