class UsersController < ApplicationController
	require 'uri'
	require 'net/http'
	require 'json'


	def give_token

		spotifyID = params[:user]
		currentUser = User.find_by spotify_user_id: spotifyID
		
		if(Time.now > currentUser.token_expiration_time)

			refreshResponse = HTTParty.post("https://accounts.spotify.com/api/token", 
				:query => {:grant_type => "refresh_token", 
						   :refresh_token => currentUser.refresh_token,
						   :client_id => ENV["SPOTIFY_CLIENT_ID"],
						   :client_secret => ENV["SPOTIFY_CLIENT_SECRET"]})

			parsedRefreshResponse = JSON.parse(refreshResponse.body)

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
