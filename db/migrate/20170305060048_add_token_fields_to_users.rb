class AddTokenFieldsToUsers < ActiveRecord::Migration[5.0]
  def change

  	add_column :users, :access_token, :string
  	add_column :users, :refresh_token, :string
  	add_column :users, :token_expiration_time, :string
	rename_column :users, :uid, :spotify_user_id

  end
end
