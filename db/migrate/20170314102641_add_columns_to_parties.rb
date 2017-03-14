class AddColumnsToParties < ActiveRecord::Migration[5.0]
  def change

	add_column :parties, :host_id, :string
	add_column :parties, :guest_song_add_state, :boolean
	add_column :parties, :down_vote_state, :boolean

  end
end
