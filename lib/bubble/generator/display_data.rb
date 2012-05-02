require "erb"

class DisplayData

  attr_reader :title, :navigation, :thumbnails

  def initialize(title, navigation = [], thumbnails = [])
    puts "Initialize DisplayData with title: #{title}, navigation: #{navigation}, thumbs:#{thumbnails}"
    @title = title
    @navigation = navigation
    @thumbnails = thumbnails
  end

  #Support templating of member data
  def get_binding
    binding
  end
end