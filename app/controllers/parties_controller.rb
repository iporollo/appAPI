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
		
		puts party["name"]
		puts party["playlist_id"]
		puts party["party_id"]
		puts party["host_spotify_id"]
		puts party["down_vote_state"]
		puts party["down_vote_state"]

		partyOwner = User.find_by spotify_user_id: party["host_spotify_id"]

		Party.create(:name => party["name"],
					 :playlistID => party["playlist_id"],
					 :partyID => party["party_id"],
					 :host_id => party["host_spotify_id"],
					 :guest_song_add_state => ç,
					 :down_vote_state => party["down_vote_state"],
					 :user_id => partyOwner.id)

	end

end
