class CherryPicker
  class Store
    attr_accessor :make, :model, :thumb
  end

  attr_reader :is_make, :is_model, :is_thumb

  def initialize
    @is_thumb = false
    @is_make = false
    @is_model = false
  end

  def start
    @store = Store.new
  end

  def done
    {"make" => @store.make, "model" => @store.model, "thumb" => @store.thumb}
  end

  def close
    {"end"=>"eof"}
  end

  def store v
    raise StandardError, 'Required to call start prior to store' if @store.nil?
    if @is_make
      @store.make = v
    elsif @is_model
      @store.model = v
    elsif @is_thumb
      @store.thumb = v
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
end