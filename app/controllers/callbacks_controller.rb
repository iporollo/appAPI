class CallbacksController < ApplicationController
	require 'uri'
	require 'net/http'
	require 'json'

	def give_token
		parsedResponse=JSON.parse(@spotifyTokenResponse) unless @spotifyTokenResponse.nil?
		put parsedResponse
		#render json: parsedResponse.access_token
	end

	def spotify_callback
 		redirect_uri = "https://aqueous-taiga-60305.herokuapp.com/spotify/callback"
		client_id = "ea09225ef2974242a1549f3812a15496"
		client_secret = "49df12072ddf49e7b176bf15b2eef15a"

		puts params
		status = params[:status]

		if(params.has_key?(:code))
			code = params[:code]

			@spotifyTokenResponse = HTTParty.post("https://accounts.spotify.com/api/token", 
				:query => {:grant_type => "authorization_code", 
						   :code => code, 
						   :redirect_uri => redirect_uri,
						   :client_id => client_id,
						   :client_secret => client_secret})

			puts @spotifyTokenResponse.as_json



		else
			error = params[:error]
		end

	end

end
