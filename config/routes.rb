Rails.application.routes.draw do

	post '/spotify/givetoken' => 'callbacks#give_token'
	get '/spotify/callback' => 'callbacks#spotify_callback'

end
