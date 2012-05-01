include VIEW::HELPER

class Model

  def initialize store
    @store = store
  end

  def create_page_from(make, model)
    puts "create_model_page_from(#{make}, #{model})"
    ["#{string2hex(model)}.html", model_display_data_from(make, model)]
  end

  private
    def model_display_data_from make, model
      puts "model_display_data_from(#{make}, #{model})"
      thumbs = @store.get_thumbs_for(make, model)
      DisplayData.new model, create_model_navigation_using(make), thumbs
    end

    def create_model_navigation_using make
      puts "create_model_navigation_using(#{make})"
      [['index', "index.html"], [make, "#{string2hex(make)}.html"]]
    end

end