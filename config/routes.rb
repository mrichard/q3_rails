Rottenpotatoes::Application.routes.draw do
  resources :movies

  match 'movies/find_by_director/:title' => 'movies#find_by_director'

  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
end
