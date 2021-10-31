# == Schema Information
#
# Table name: promotions
#
#  id             :bigint           not null, primary key
#  promotion_type :integer          default(0)
#  status         :integer          default(0)
#  value          :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  product_id     :bigint           not null
#
# Indexes
#
#  index_promotions_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
class Promotion < ApplicationRecord
  belongs_to :product, touch: true  
  enum promotion_type: [:discount, :gift, :referral_bonus, :combo_product]
  enum status: [:started, :finished, :schedule]
end
