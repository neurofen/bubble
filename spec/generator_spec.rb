require "spec_helper"

include RSpec::Mocks::ExampleMethods

describe Generator do

  before :all do
    @output_path = 'output_path'
    @processor = double("Processor")
    @file_writer = double("FileWriter")

    @generator = Generator.new(@processor, @output_path, @file_writer)
  end

  describe "#new" do
    it "takes a template renderer and returns a Generator instance" do
      @generator.should be_an_instance_of Generator
    end

    it "throws an error when instantiated with nil Processor" do
      expect { Generator.new(nil, @output_path, @file_writer) }.should raise_error
    end

    it "throws an error when instantiated with nil output path" do
      expect { Generator.new(@processor, nil, @file_writer) }.should raise_error
    end

    it "throws an error when instantiated with empty output path" do
      expect { Generator.new(@processor, "", @file_writer) }.should raise_error
    end

    it "throws an error when instantiated with nil FileWriter" do
      expect { Generator.new(@processor, @output_path, nil) }.should raise_error
    end
  end

end