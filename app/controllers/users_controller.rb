class UsersController < ApplicationController
	require 'uri'
	require 'net/http'
	require 'json'


	def give_token

		client_id = "ea09225ef2974242a1549f3812a15496"
		client_secret = "49df12072ddf49e7b176bf15b2eef15a"

		spotifyID = params[:user]
		currentUser = User.find_by spotify_user_id: spotifyID
		
		if(Time.now > currentUser.token_expiration_time)

			puts encodedClientSecret
			puts encodedClientID
			refreshResponse = HTTParty.post("https://accounts.spotify.com/api/token", 
				:query => {:grant_type => "refresh_token", 
						   :refresh_token => currentUser.refresh_token
						   :client_id => client_id,
						   :client_secret => client_secret})

			parsedRefreshResponse = JSON.parse(refreshResponse.body)

			puts parsedRefreshResponse

			#check is parsedRefreshResponse["error"]

			currentUser.update_attribute(:access_token, parsedRefreshResponse["access_token"])
			currentUser.update_attribute(:token_expiration_time, Time.now + parsedRefreshResponse["expires_in"])

		end

		render :json => {:token => currentUser.access_token}
	end

	def give_spotify_id

	 	lastCreatedSpotifyID = User.last.spotify_user_id
	 	render :json => {:id => lastCreatedSpotifyID}

	end


end
