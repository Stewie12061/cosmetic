# == Schema Information
#
# Table name: ingredients
#
#  id         :bigint           not null, primary key
#  name       :string
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Ingredient < ApplicationRecord
  has_many :product_ingredients, dependent: :destroy
  has_many :products, through: :product_ingredients
end
