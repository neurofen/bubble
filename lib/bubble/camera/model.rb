class Model

  attr_reader :name

  def initialize name
    @name = name
  end

  def eql? obj
    self.class.equal?(obj.class) &&
        name == obj.name
  end

  def hash
    name.hash
  end
end