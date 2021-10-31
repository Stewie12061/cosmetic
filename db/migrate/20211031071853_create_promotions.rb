class CreatePromotions < ActiveRecord::Migration[6.1]
  def change
    create_table :promotions do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :promotion_type, default: 0
      t.integer :value, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
