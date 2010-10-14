Projoscope::Application.routes.draw do
  match '*project' => 'home#index'
  root :to => "home#index"
end
