module LocaleHelper
  def i18n_product(key)
    I18n.t(product_locales(key))
  end
  private
  def product_locales(key)
    {
      description: 'product.detail.description',
      recommended: 'product.detail.recommended',
      benefit: 'product.detail.benefit',
      ingredient: 'product.detail.ingredient',
      how_to_use: 'product.detail.how_to_use'
    }[key.to_sym]
  end
end