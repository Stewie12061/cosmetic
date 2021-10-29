class CreateFavourites < ActiveRecord::Migration[6.1]
  def change
    create_table :favourites do |t|
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
