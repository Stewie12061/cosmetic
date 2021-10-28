  # frozen_string_literal: true

module ProductDecorator
  include ProductHelper
  def ribbon
    return new_product if self.newly?    
  end

  private
  def new_product?
    self.created_at + 7.days <= Time.zone.now
  end
end

