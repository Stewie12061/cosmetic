# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  price       :decimal(8, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class Product < ApplicationRecord
  has_many_attached :images
  belongs_to :category
end
