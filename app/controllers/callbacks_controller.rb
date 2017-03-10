class CallbacksController < ApplicationController
	require 'uri'
	require 'net/http'
	require 'json'

	def spotify_callback

 		redirect_uri = "https://aqueous-taiga-60305.herokuapp.com/spotify/callback"

		status = params[:status]

		if(params.has_key?(:code))
			code = params[:code]

			spotifyTokenResponse = HTTParty.post("https://accounts.spotify.com/api/token", 
				:query => {:grant_type => "authorization_code", 
						   :code => code, 
						   :redirect_uri => redirect_uri,
						   :client_id => ENV["SPOTIFY_CLIENT_ID"],
						   :client_secret => ENV["SPOTIFY_CLIENT_SECRET"]})

			parsedTokenResponse = JSON.parse(spotifyTokenResponse.body);


			spotifyProfileResponse = HTTParty.get("https://api.spotify.com/v1/me", 
				:headers => {"Authorization"=> "Bearer #{parsedTokenResponse["access_token"]}"})
			parsedProfileResponse = JSON.parse(spotifyProfileResponse.body)
			
			now = Time.now
			tokenExpirationTime = now + (parsedTokenResponse["expires_in"])
			

			User.where(:spotify_user_id => parsedProfileResponse["id"]).first_or_create(:access_token => parsedTokenResponse["access_token"], 
					 :refresh_token => parsedTokenResponse["refresh_token"], 
					 :token_expiration_time => tokenExpirationTime,
					 :spotify_user_id => parsedProfileResponse["id"])

		else
			error = params[:error]
		end

	end

end
