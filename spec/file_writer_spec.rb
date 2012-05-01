require "spec_helper"

describe FileWriter do

  before :all do
    @templateRender = double("DataTemplateBinder")
    @file_maker = double("FileMaker")
    @file_writer = FileWriter.new(@templateRender, @file_maker)
  end

  describe "#new" do
    it "takes a DataTemplateBinder and FileMaker and returns a FileWriter instance" do
      @file_writer.should be_an_instance_of FileWriter
    end

    it "throws an error when instantiated with nil template renderer" do
      expect { FileWriter.new(nil, @file_maker) }.should raise_error
    end

    it "throws an error when instantiated with nil FileMaker" do
      expect { FileWriter.new(@file_writer, nil) }.should raise_error
    end

  end

  describe "#write_to_page" do
    it "writes content to a file at filename" do
      filename = 'a file name'
      @file_maker.should_receive(:make_writable).once.with(filename, kind_of(Proc))
      @file_writer.write_to_page filename, nil
    end
  end

end