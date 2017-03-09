Rails.application.routes.draw do

	get '/user/givetoken' => 'users#give_token'
	get '/user/spotifyuserid' => 'users#give_spotify_id'

	get '/spotify/callback' => 'callbacks#spotify_callback'

end
