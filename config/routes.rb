Rails.application.routes.draw do

	get '/user/givetoken' => 'users#give_token'
	get '/user/justcreatedrailsid' => 'users#give_rails_uid'
	post '/user/updateuserspotifyid' => 'users#update_spotify_id'

	get '/spotify/callback' => 'callbacks#spotify_callback'

end
