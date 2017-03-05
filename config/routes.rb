Rails.application.routes.draw do

	get '/spotify/givetoken' => 'callbacks#give_token'
	get '/spotify/callback' => 'callbacks#spotify_callback'

end
