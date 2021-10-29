class CreateBenefits < ActiveRecord::Migration[6.1]
  def change
    create_table :benefits do |t|
      t.references :product, null: false, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
