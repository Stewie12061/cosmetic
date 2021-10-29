module ApplicationHelper
  def authencation_menu
    [:home, :products, :orders]
  end

  def guest_menu
    [:home, :products, :signup, :signin]
  end

  def map_path(path)
    #[paths.uniq, [root_path, products_path, orders_path]].transpose.to_h
    {
      home: root_path, 
      products: products_path, 
      orders: orders_path,
      signup: new_user_registration_path, 
      signin: new_user_session_path 
    } [path.to_sym]
  end

  def color_active_class(path)
    #is_active?(path) ? 'text-secondary' : 'text-white'
    class_names({'text-secondary': is_active?(path), 'text-white': !is_active?(path)})
  end

  def is_active?(path)
    paths.include?(path.to_sym) && request_name == path.to_sym
  end

  def svg_id(title)
    title.downcase.to_sym == :products ? 'svg-products' : title
  end

  private

  def request_name
    (path = request.path_info.gsub(/^\//, '').to_sym).blank? ? :home : path
  end

  def paths
    authencation_menu+guest_menu
  end
end
