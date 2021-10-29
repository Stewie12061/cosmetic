# == Schema Information
#
# Table name: favourites
#
#  id         :bigint           not null, primary key
#  status     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_favourites_on_product_id  (product_id)
#  index_favourites_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (user_id => users.id)
#
class Favourite < ApplicationRecord
  enum favourite_type: [ :like ]
  belongs_to :product
  belongs_to :user

end
