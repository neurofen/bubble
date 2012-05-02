include VIEW::HELPER

class Model

  def initialize store
    @store = store
  end

  def create_page_from(make, model, thumb_bucket)
    puts "create_model_page_from(#{make}, #{model})"
    ["#{string2hex(model)}.html", model_display_data_from(make, model, thumb_bucket)]
  end

  private
    def model_display_data_from make, model, thumb_bucket
      thumbs = @store.get_thumbs_for(make, model)
      thumb_bucket.add thumbs
      DisplayData.new model, create_model_navigation_using(make), thumbs
    end

    def create_model_navigation_using make
      [['index', "index.html"], [make, "#{string2hex(make)}.html"]]
    end

end