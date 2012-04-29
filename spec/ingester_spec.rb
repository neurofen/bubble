require "spec_helper"

describe Ingester do

  before :all do
    @processor = Processor.new('blah', 'blah')
    @bubble_store = BubbleStore.new()
    @ingester = Ingester.new(@processor, @bubble_store)
  end

  describe "#new" do
    it "takes processor and bubbleStore, returns a Ingester instance" do
      @ingester.should be_an_instance_of Ingester
    end

    it "throws an error when instantiated with nil processor" do
      expect { Ingester.new(nil, @bubble_store) }.should raise_error
    end

    it "throws an error when instantiated with an unexpected type for Processor" do
      expect { Ingester.new(self, @bubble_store) }.should raise_error
    end

    it "throws an error when instantiated with nil bubbleStore" do
      expect { Ingester.new(@processor, nil) }.should raise_error
    end

    it "throws an error when instantiated with an unexpected type for bubbleStore" do
      expect { Ingester.new(@processor, self) }.should raise_error
    end
  end

  #describe "startIngesting" do
  #  @ingester.startIngesting(:xml_file_path)
  #end
end