class ThumbBucket

  attr_reader :limit, :remaining

  def initialize limit = 10
    @limit = limit
    @remaining = limit
    @thumbs = []
  end

  def add items
    if items.class == Array
      add_array items
    else
      add_item items
    end
  end

  def contents
    Array.new @thumbs
  end

  private
    def add_item item
      if @remaining > 0
        @thumbs.push(item)
        @remaining -= 1
      end
    end

    def add_array items
      items.each do |item|
        self.add item
      end
    end
end