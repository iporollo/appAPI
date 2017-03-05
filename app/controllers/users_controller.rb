class UsersController < ApplicationController
	require 'uri'
	require 'net/http'
	require 'json'


	def give_token
		uid = params[:user]
		currentUser = Users.find(uid)
		puts currentUser
		render currentUser.access_token
	end

	def give_rails_uid

		lastCreatedUID = Users.last.id

		render lastCreatedUID 

	end

end
