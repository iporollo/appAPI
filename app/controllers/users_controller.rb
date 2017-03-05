class UsersController < ApplicationController
	require 'uri'
	require 'net/http'
	require 'json'


	def give_token
		uid = params[:user]
		puts uid
		currentUser = User.find(uid)
		puts currentUser
		render currentUser.access_token
	end

	def give_rails_uid

		lastCreatedUID = User.last.id
		puts lastCreatedUID
		render lastCreatedUID 

	end

end
