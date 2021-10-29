module ProductsHelper
  def ribbon(product)
    return new_product if product.newly?    
  end

  def popular
    ribbon_tag 'popular', :left
  end

  def promotion
    ribbon_tag 'promotion'
  end

  def new_product
    ribbon_tag 'new', :left
  end

  def favourites
    ['far fa-heart', 'fas fa-cart-plus']
  end

  def description_headers
    [:description, :recommended, :benefit, :ingredient, :how_to_use]
  end

  def tab_attributes(name)
    %Q(
      id=tab-#{name} data-bs-toggle=pill data-bs-target=detail-#{name} type=button role=tab aria-controls=pills-#{name}
    )
  end

  def detail_active(index)
    class_names({'active': index == 0})
  end

  private
  def ribbon_tag(name, position=:right)
    cls = 'ribbon-left' if position == :left
    content_tag :div, class: "ribbon text-uppercase #{cls}" do
      content_tag :span, t("ribbon.#{name}")
    end
  end
end
