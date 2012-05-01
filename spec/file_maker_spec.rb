require "spec_helper"

describe FileMaker do

  before :all do
    output_path = './'
    @file_maker = FileMaker.new(output_path)
  end

  describe "#new" do
    it "takes a output path and returns a FileMaker instance" do
      @file_maker.should be_an_instance_of FileMaker
    end

    it "throws an error when instantiated with nil output path" do
      expect { FileMaker.new(nil) }.should raise_error
    end

    it "throws an error when instantiated with empty output path" do
      expect { FileMaker.new("") }.should raise_error
    end

  end

  describe "#make_writable" do
    it "writes content to a file at filename" do
      filename = 'a file name'
      test = lambda{|file| file.should be_instance_of File}
      #@file_maker.should_receive(:make_writable).once.with(filename, kind_of(Proc))
      @file_maker.make_writable filename, test
    end
  end

end