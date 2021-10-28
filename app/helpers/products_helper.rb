module ProductsHelper
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

  private
  def ribbon_tag(name, position=:right)
    cls = 'ribbon-left' if position == :left
    content_tag :div, class: "ribbon text-uppercase #{cls}" do
      content_tag :span, t("ribbon.#{name}")
    end
  end
end
