class FacebookPage
  attr_accessor :category_name, :access_token, :name, :id, :perms

  def initialize attributes = {}
    attributes.each do |name, value|
      send "#{name}=", value
    end
  end

  def persisted?
    false
  end
end
