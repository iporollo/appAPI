Rails.application.routes.draw do

	get '/user/givetoken/:id' => 'users#give_token'
	get "/user/justcreatedrailsid" => 'users#give_rails_uid'
	get '/spotify/callback' => 'callbacks#spotify_callback'

end
