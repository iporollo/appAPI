class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|

    	#idk if i need this

      t.timestamps
    end
  end
end
