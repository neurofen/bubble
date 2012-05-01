require "spec_helper"


describe Generator do

  before :each do
    @processor = double("Processor")
    @file_writer = double("FileWriter")
    @processor.should_receive(:bubble_store).once
    @generator = Generator.new(@processor, @file_writer)
  end

  describe "#new" do
    it "takes a template renderer and file writer and returns a Generator instance" do
      @generator.should be_an_instance_of Generator
    end

    it "throws an error when instantiated with nil Processor" do
      expect { Generator.new(nil, @file_writer) }.should raise_error
    end

    it "throws an error when instantiated with nil FileWriter" do
      expect { Generator.new(@processor, nil) }.should raise_error
    end
  end

end