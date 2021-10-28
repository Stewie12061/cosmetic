# frozen_string_literal: true

require 'test_helper'

class ProductDecoratorTest < ActiveSupport::TestCase
  def setup
    @product = Product.new.extend ProductDecorator
  end

  # test "the truth" do
  #   assert true
  # end
end
