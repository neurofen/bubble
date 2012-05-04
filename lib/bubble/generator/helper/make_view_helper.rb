include VIEW::HELPER

class Make

  def initialize store
    @store = store
  end

  def create_page_from(make, models, thumb_bucket)
    # puts "create_make_page_from(#{make}, #{models})"
    ["#{string2hex(make)}.html", make_display_data_from(make, models, thumb_bucket)]
  end

  private
    def make_display_data_from(make, models, thumb_bucket)
      #DisplayData.new make, create_make_navigation_using(models), @store.get_thumbs_for(make, models[0]).first(10)
      DisplayData.new make, create_make_navigation_using(models), thumb_bucket.contents
    end

    def create_make_navigation_using models
      navigation = []
      navigation.push(['index', "index.html"])
      models.each do |model|
        navigation.push([model, "#{string2hex(model)}.html"])
      end
      navigation
    end
end