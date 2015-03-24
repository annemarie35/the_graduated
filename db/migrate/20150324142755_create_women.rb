class CreateWomen < ActiveRecord::Migration
  def change
  	create_table :women do |t|
      t.string :firstname
      t.string :lastname
      t.string :niveau
      t.timestamps
    end
  end
end