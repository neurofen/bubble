require "spec_helper"

describe FileWriter do

  before :all do
    templateRender = DataTemplateBinder.new 'template'
    @file_writer = FileWriter.new(templateRender)
  end

  describe "#new" do
    it "takes a template renderer and returns a FileWriter instance" do
      @file_writer.should be_an_instance_of FileWriter
    end

    it "throws an error when instantiated with nil" do
      expect { FileWriter.new(nil) }.should raise_error
    end
  end

end