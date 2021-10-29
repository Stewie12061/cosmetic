# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  price       :decimal(8, 2)
#  quantitly   :integer          default(0)
#  status      :integer          default("newly")
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
  # extend ProductHelper

  has_many_attached :images
  belongs_to :category
  has_many :benefits, dependent: :destroy
  has_many :user_likes, foreign_key: 'product_id', class_name: 'Favourite', dependent: :delete_all
  has_many :product_ingredients, dependent: :destroy
  has_many :ingredients, through: :product_ingredients
  has_many :recommendeds, dependent: :destroy

  enum status: [     
    :newly, :normally, :close_date, 
    :out_of_stocks, :stop_producing, :waiting_price 
  ]

  scope :by_limit, -> (size=50) {includes(:category).limit(size)}

  after_create_commit { broadcast_prepend_to "products" }
  after_destroy_commit { broadcast_remove_to "products" }
  after_update_commit { broadcast_replace_to "products" }

  def attach_url(index = 0)
    return nil unless self.images.attached?
    len = self.images.length - 1
    image = self.images[index > len ? len :  index]
    return nil unless image.present?
    is_storage_from_disk? ? storage_local_path(image.key) : storage_public_path(image.key)
  end

  def thumbnail
    return nil unless self.images.attached?
    image = self.images.first
    image.variable? ? image.variant(resize: '200x200') : image
    # is_storage_from_disk? ? storage_local_path(image.key) : storage_public_path(image.key)
  end

  def category_name
    self.category.name.gsub(/\-/, ' ')
  end

  private
  def new_product?
    self.created_at + 7.days <= Time.zone.now
  end

end
