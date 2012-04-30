require "spec_helper"

include RSpec::Mocks::ExampleMethods

describe GeneratorFactory do

  before :all do
    @template = File.expand_path('../../data/templates/output-template.html', __FILE__)
    @processor = double("Processor")
    @factory = GeneratorFactory.new(@processor, @template)
  end

  describe "#new" do
    it "takes a Processor and returns a new instance" do
      @factory.should be_instance_of GeneratorFactory
    end

    it "throws an error when instantiated with nil Processor" do
      expect { GeneratorFactory.new(nil, @template) }.should raise_error
    end

    it "throws an error when instantiated with nil template filename" do
      expect { GeneratorFactory.new(@processor, nil) }.should raise_error
    end

    it "throws an error when instantiated with empty template filename" do
      expect { GeneratorFactory.new(@processor, "") }.should raise_error
    end
  end

  describe "#create_generator_for" do
    it "creates an instance of Generator" do
      @output_path = '/tmp'
      @generator = @factory.create_generator_for(@output_path)
      @generator.should be_instance_of Generator
    end

    it "throws an error when called with nil output path" do
      expect { @factory.create_generator_for nil }.should raise_error
    end

    it "throws an error when called with empty output path" do
      expect { @factory.create_generator_for "" }.should raise_error
    end

  end
end