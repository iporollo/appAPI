Rails.application.routes.draw do

	post '/spotify/callback' => 'callbacks#spotify_callback'

end
