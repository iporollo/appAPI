class UsersController < ApplicationController
	require 'uri'
	require 'net/http'
	require 'json'


	def give_token
		spotifyID = params[:user]
		currentUser = User.where(:spotify_user_id => spotifyID)
		puts currentUser
		render :json => {:token => currentUser.access_token}
	end

	def give_spotify_id

	 	lastCreatedSpotifyID = User.last.spotify_user_id
	 	render :json => {:id => lastCreatedSpotifyID}

	end


end
