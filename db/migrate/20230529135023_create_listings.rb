class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :location
      t.string :description
      t.integer :price
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
