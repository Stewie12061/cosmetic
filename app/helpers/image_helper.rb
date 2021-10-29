module ImageHelper
  def thumbnail(image)
    image.nil? ? default_image : url_for(image)
  end

  def default_image
    asset_pack_path 'media/images/cs.png'
  end

  def lozad_class(image)
    %Q(
      data-background-image=#{thumbnail(image)}
    )
  end

  def splide_lazy(image)
    %Q(
      data-splide-lazy=#{url_for(image)}
    )
  end
end