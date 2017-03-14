class AddReferencesToModels < ActiveRecord::Migration[5.0]
  def change
  	
  	add_reference :parties, :user, foreign_key: true
  	add_reference :songs, :party, foreign_key: true
  	add_reference :members, :party, foreign_key: true

  end
end
