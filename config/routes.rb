Rails.application.routes.draw do

	#get '/spotify/callback' => 'users#callback_hit'
	post '/spotify/callback' => 'users#callback_hit'


end
