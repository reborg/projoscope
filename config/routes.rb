Projoscope::Application.routes.draw do
  match "/lighthouse/(:user/(:project))" => "lighthouse#index"
  root :to => "home#index"
end
