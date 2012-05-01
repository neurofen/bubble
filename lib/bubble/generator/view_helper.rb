class ViewHelper

  def initialize store
    make = Make.new store
    model = Model.new store
    index = Index.new
    @helpers = {
        :MAKE => make,
        :MODEL => model,
        :INDEX => index
    }
  end


  def create_page_for type
    lambda {|arg1, arg2| return @helpers[type].create_page_from(arg1, arg2)}
  end
end