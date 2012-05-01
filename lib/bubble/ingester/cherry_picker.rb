class CherryPicker
  class Store
    attr_accessor :make, :model, :thumb
  end

  attr_reader :is_make, :is_model, :is_thumb

  def initialize processor
    @processor = processor
    @is_thumb = false
    @is_make = false
    @is_model = false
  end

  def start
    @store = Store.new
  end

  def done
    raise StandardError, 'Required to call #start prior to #done' if @store.nil?
    @processor.store create_record unless @store.make.nil? || @store.model.nil?
  end

  def close
     @processor.next
  end

  def store val
    raise StandardError, 'Required to call start prior to #store' if @store.nil?
    if @is_make
      puts "storing [#{val}] as make"
      @store.make = val
    elsif @is_model
      puts "storing [#{val}] as model"
      @store.model = val
    elsif @is_thumb
      puts "storing [#{val}] as thumb"
      @store.thumb = val
    end
  end

  def use_make
    @is_make = true
    @is_model = false
    @is_thumb = false
  end

  def use_model
    @is_model = true
    @is_make = false
    @is_thumb = false
  end

  def use_thumb
    @is_thumb = true
    @is_make = false
    @is_model = false
  end

  def no_store
    @is_thumb = false
    @is_make = false
    @is_model = false
  end

  private
    def create_record
      {:make => @store.make, :model => @store.model, :thumb => @store.thumb}
    end
end