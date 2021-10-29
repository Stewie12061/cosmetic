class CreateRecommendeds < ActiveRecord::Migration[6.1]
  def change
    create_table :recommendeds do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :recommended_type, default: 0
      t.string :value

      t.timestamps
    end
  end
end
