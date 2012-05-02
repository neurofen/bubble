class Generator

  def initialize(processor, file_writer, view_helper)
    raise ArgumentError, 'Processor missing' if processor.nil?
    raise ArgumentError, 'FileWriter missing' if file_writer.nil?
    raise ArgumentError, 'ViewHellper missing' if view_helper.nil?
    @processor = processor
    @file_writer = file_writer
    @store = @processor.bubble_store
    @view_helper = view_helper
  end

  def start
    all_makes = @store.get_all_makes
    puts "found #{all_makes.length} makes : #{all_makes}"

    all_makes.each do |make|
      generate_make_from(make, with_models_for(make))
    end

    generate_index_from('index', all_makes)
    @processor.done
  end

  private
  def with_models_for make
    make_models = @store.get_models_for(make)
    make_models.each do |model|
      create_page_for(:MODEL, make, model)
    end
    make_models
  end

  def generate_make_from make, make_models
    create_page_for(:MAKE, make, make_models)
  end

  def generate_index_from title, makes
    create_page_for(:INDEX, title, makes)
  end

  def create_page_for type, arg1, arg2
    render @view_helper.create_page_for(type)[arg1, arg2]
  end

  def render result
    @file_writer.write_to_page result[0], result[1]
  end

end