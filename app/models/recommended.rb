# == Schema Information
#
# Table name: recommendeds
#
#  id               :bigint           not null, primary key
#  recommended_type :integer          default(0)
#  value            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  product_id       :bigint           not null
#
# Indexes
#
#  index_recommendeds_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
class Recommended < ApplicationRecord
  belongs_to :product
end
