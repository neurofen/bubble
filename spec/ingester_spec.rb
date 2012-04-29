require "spec_helper"

describe Ingester do

  before :all do
    @processor = Processor.new()
    @ingester = Ingester.new @processor
  end

  describe "#new" do
    it "takes processor and returns a Ingester instance" do
      @ingester.should be_an_instance_of Ingester
    end

    it "throws an error when instantiated with nil" do
      expect { Ingester.new(nil) }.should raise_error
    end

    it "throws an error when instantiated with an unexpected type" do
      expect { Ingester.new(self) }.should raise_error
    end
  end

  #describe "startIngesting" do
  #  @ingester.startIngesting(:xml_file_path)
  #end
end