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
    #puts "found #{all_makes.length} makes : #{all_makes}"
    index_thumbs = ThumbBucket.new
    monitor = @processor.monitor all_makes.length

    generate_make_and_model_pages_for(all_makes, index_thumbs, monitor)
    generate_index_from('index', all_makes, index_thumbs)

    @processor.done
  end

  private
  def generate_make_and_model_pages_for(all_makes, index_thumbs, monitor)
    all_makes.each do |make|
      monitor.notify
      make_thumbs = ThumbBucket.new

      generate_make_from(make, with_models_for(make, make_thumbs), make_thumbs)
      index_thumbs.add make_thumbs.contents
    end
  end

  def with_models_for make, thumb_bucket
    make_models = @store.get_models_for(make)
    make_models.each do |model|
      create_page_for(:MODEL, make, model, thumb_bucket)
    end
    make_models
  end

  def generate_make_from make, make_models, thumb_bucket
    create_page_for(:MAKE, make, make_models, thumb_bucket)
  end

  def generate_index_from title, makes, thumb_bucket
    create_page_for(:INDEX, title, makes, thumb_bucket)
  end

  def create_page_for type, arg1, arg2, arg3
    render @view_helper.create_page_for(type)[arg1, arg2, arg3]
  end

  def render result
    @file_writer.write_to_page result[0], result[1]
  end

end