module PlaceholderHelper
  def placeholder_text(name)
    I18n.t(placeholders(name))
  end

  private
  def placeholders(name=nil)
    {
      email_address: 'activerecord.attributes.user.email_address',
      password: 'activerecord.attributes.user.password',
      password_confirmation: 'activerecord.attributes.user.password_confirmation'
    }[name.to_sym]
  end
end