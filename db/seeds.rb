# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require 'open-uri'

def new_record?(row)
  row['name'].present?
end

def create_product(row, category)
  p "Create product #{row['name']}"
  Product.create(
    name: row['name'].downcase,
    description: row['description'].downcase,
    price: row['price'],
    category_id: category.id
  )
end

def add_images(product, url)
  p "- Add image for product #{product.name}"
  url.strip!
  product.images.add_attach(
    io:URI.parse(url).open,
    filename: File.basename(url)
  )
end

Product.destroy_all
CSV.foreach(
  Rails.root.join('db/csv/products.csv'),
  headers: true
) do |row|
  @category = Category.find_or_create_by(name: row['category'].downcase) if row['category'].present?
  @product = create_product(row, @category) if new_record?(row)
  add_images(@product, row['images']) if row['images'].present?
end