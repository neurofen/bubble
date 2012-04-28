class Make
  attr_reader :title, :models

  def initialize(title)
    raise ArgumentError, 'Make name is nil' if title.nil?
    raise ArgumentError, 'Make name is empty' if title.empty?

    @title = title
    @models = []
  end

  def has_model? model
    @models.include? model
  end

  def add_update_model model
    @models.push(model)
    self
  end
end