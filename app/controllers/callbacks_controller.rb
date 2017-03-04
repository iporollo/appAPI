class CallbacksController < ApplicationController
	require 'uri'
	require 'net/http'
	require 'json'

	def spotify_callback
 		redirect_uri = "https://aqueous-taiga-60305.herokuapp.com/spotify/callback"
		client_id = "ea09225ef2974242a1549f3812a15496"
		client_secret = "49df12072ddf49e7b176bf15b2eef15a"

		puts params
		status = params[:status]

		if(params.has_key?(:code))
			code = params[:code]

			response = HTTParty.post("https://accounts.spotify.com/api/token", 
				:query => {:grant_type => "authorization_code", 
						   :code => code, 
						   :redirect_uri => redirect_uri,
						   :client_id => client_id,
						   :client_secret => client_secret})

			puts response
			#render json bullshit
			#render json: response access token
			#parsedResponse=JSON.parse(response)
			#accessToken = parsedResponse.accessToken
			#have to check some shit for that also idk figure it out 

		else
			error = params[:error]
		end

	end

end
