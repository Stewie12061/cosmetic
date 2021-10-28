module OrdersHelper
  def currency(num)
    num == 0.0 ? price_contact : n2c(num)
  end

  private
  def price_contact
    content_tag :div, t('orders.price_contact'), class: 'text-capitalize text-danger'
  end

  def n2c(num)
    number_to_currency(
        num*1000, 
        unit: 'đ', 
        format: '<div>%n<sup>%u</sup></div>'.html_safe, 
        separator: '.', 
        delimiter: ','
      ).gsub(/\.0+\</, '<').html_safe
  end
end
