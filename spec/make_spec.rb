require "spec_helper"

describe Make do

  :make_title

  @model = Model.new :model_title

  before :each do
    @make = Make.new(:make_title)
  end

  describe "#new" do
    it "takes a make description and returns a Make instance" do
      @make.should be_an_instance_of Make
    end

    it "throws an error when instantiated with an empty string" do
      expect { Make.new('') }.should raise_error
    end

    it "throws an error when instantiated with nil" do
      expect { Make.new(nil) }.should raise_error
    end
  end

  describe "#title" do
    it "returns the make name passed during instantiation" do
      @make.title.should eql :make_title
    end
  end

  describe "#has_model" do
    it "be true for an existing model" do
      @make.add_update_model @model
      @make.has_model?(@model).should be_true
    end

    it "returns false for a non-existent model" do
      unknown = Model.new 'unknown'
      @make.has_model?(unknown).should be_false
    end
  end

  #describe "#add_update_model" do
  #  it 'add a new model'
  #end

end