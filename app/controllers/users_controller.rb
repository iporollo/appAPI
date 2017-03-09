class UsersController < ApplicationController
	require 'uri'
	require 'net/http'
	require 'json'


	def give_token
		spotifyID = params[:user]
		currentUser = User.find_by spotify_user_id: spotifyID
		puts currentUser
		puts currentUser.access_token
		#I need to add a check here for access token expiration
		render :json => {:token => currentUser.access_token}
	end

	def give_spotify_id

	 	lastCreatedSpotifyID = User.last.spotify_user_id
	 	render :json => {:id => lastCreatedSpotifyID}

	end


end
