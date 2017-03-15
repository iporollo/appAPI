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

		partyOwner = User.find_by spotify_user_id: params[:host_spotify_id]

		Party.create(:name => params[:name], 
			:playlistID => params[:playlist_id],
			:partyID => params[:party_id],
					 :guest_song_add_state => params[:guest_song_add_state],
					 :down_vote_state => params[:down_vote_state],
					 :user_id => partyOwner.id)

	end

end
