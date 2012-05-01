require "erb"

class DisplayData

  attr_reader :title, :navigation, :thumbnails

  def initialize(title, navigation = [], thumbnails = [])
    @title = title
    @navigation = navigation
    @thumbnails = thumbnails
  end

  #Support templating of member data
  def get_binding
    binding
  end
end