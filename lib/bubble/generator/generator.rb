require 'fiber'

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
    @processor.monitor.start(:BAR, @store.get_number_of_makes)

    generate_by(@store.get_all_makes_batched_by(100)).resume
    
    @processor.done
  end

  private

  def generate_by source
    index_thumbs = ThumbBucket.new

    Fiber.new do
      while source.alive? do
        batch = source.resume
        generate_make_and_model_pages_for(batch, index_thumbs)
      end
      generate_index_from('index', @store.get_all_makes, index_thumbs)
    end    
  end

  def generate_make_and_model_pages_for(all_makes, index_thumbs)
    all_makes.each do |make|
      @processor.monitor.notify :BAR

      make_thumbs = ThumbBucket.new
      generate_make_from(make, with_models_for(make, make_thumbs), make_thumbs)
      index_thumbs.add make_thumbs.contents
    end unless all_makes.nil?
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