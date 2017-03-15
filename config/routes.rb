Rails.application.routes.draw do

	get '/user/givetoken' => 'users#give_token'
	get '/user/spotifyuserid' => 'users#give_spotify_id'

	get '/party/checkcode' => 'parties#check_party_id'
	post '/party/create' => 'parties#create'

	get '/spotify/callback' => 'callbacks#spotify_callback'

end
