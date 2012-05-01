class Generator

  def initialize(processor, file_writer)
    raise ArgumentError, 'Processor missing' if processor.nil?
    raise ArgumentError, 'FileWriter missing' if file_writer.nil?
    @processor = processor
    @file_writer = file_writer
    @view_helper = @processor.bubble_store

  end

  def start
    all_makes = @view_helper.get_all_makes
    puts "found #{all_makes.length} makes : #{all_makes}"
    all_makes.each do |make|
      make_models = @view_helper.get_models_for(make)
      make_models.each do |model|
        create_model_page_from(make, model)
      end
      create_make_page_from(make, make_models)
    end
    create_index_page_from(all_makes)
    @processor.done
  end

  #title, navigation = [], thumbnails = []
  private
  #Create index
    def create_index_page_from all_makes
      @file_writer.write_to_page("index.html", index_display_data_from(all_makes))
    end

    def index_display_data_from all_makes
      DisplayData.new('index', create_index_navigation_using(all_makes), [])
    end

    def create_index_navigation_using all_makes
      navigation = []
      all_makes.each do |make|
        navigation.push([ make, "#{string2hex(make)}.html" ])
      end
      navigation
    end

  #Creating Makes
    def create_make_page_from(make, models)
      puts "create_make_page_from(#{make}, #{models})"
       @file_writer.write_to_page("#{string2hex(make)}.html", make_display_data_from(make, models))
    end

    def make_display_data_from(make, models)
      puts "make_display_data_from{#{make}, #{models})"
      DisplayData.new make, create_make_navigation_using(models), @view_helper.get_thumbs_for(make, models[0]).first(10)
    end

    def create_make_navigation_using models
      puts "create_make_navigation_using{#{models})"
      navigation = []
      navigation.push([ 'index',  "index.html" ])
      models.each do |model|
        navigation.push([ model,  "#{string2hex(model)}.html" ])
      end
      navigation
    end

  #Creating models
    def create_model_page_from(make, model)
      puts "create_model_page_from(#{make}, #{model})"
      @file_writer.write_to_page("#{string2hex(model)}.html", model_display_data_from(make, model))
    end

    def model_display_data_from make, model
      puts "model_display_data_from(#{make}, #{model})"
      thumbs = @view_helper.get_thumbs_for(make, model)
      DisplayData.new model, create_model_navigation_using(make), thumbs
    end

    def create_model_navigation_using make
      puts "create_model_navigation_using(#{make})"
      [ [ 'index', "index.html"], [ make, "#{string2hex(make)}.html" ] ]
    end

    def string2hex(string)
      string.unpack('U'*string.length).collect {|x| x.to_s 16}.join
    end
end