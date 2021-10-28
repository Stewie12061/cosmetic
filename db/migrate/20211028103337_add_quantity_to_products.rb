class AddQuantityToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :quantitly, :integer, default:0
  end
end
