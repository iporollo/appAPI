class PartiesController < ApplicationController

	def check_party_id
		party_id = params[:partyid]
		exists = false

		if Party.exists?(partyID: party_id)
			exists = true
		end
			
		render :json => {:id_exists => exists}
	end

	def create

		party = params[:party]
		parsedParty = JSON.parse(party)

		puts parsedParty["name"]

	end

end
