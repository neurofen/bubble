require "spec_helper"

describe FileWriter do

  :output_path

  before :all do
    @file_writer = FileWriter.new(:output_path)
  end

  describe "#new" do
    it "takes an output path and returns a FileWriter instance" do
      @file_writer.should be_an_instance_of FileWriter
    end

    it "throws an error when instantiated with an empty string" do
      expect { FileWriter.new('') }.should raise_error
    end

    it "throws an error when instantiated with nil" do
      expect { FileWriter.new(nil) }.should raise_error
    end
  end

end