require "spec_helper"

describe GeneratorFactory do

  before :all do
    @processor = Processor.new('blah', 'blah')
    @bubble_store = BubbleStore.new()
    @factory = GeneratorFactory.new @processor, @bubble_store
  end
  describe "#new" do
    it "takes a Processor and BubbleStore and returns a new instance" do
      @factory.should be_instance_of GeneratorFactory
    end
  end

  describe "#createGeneratorFor" do
    it "creates an instance of Generator" do
      @output_path = 'xml source path'
      @generator = @factory.createGeneratorFor(@output_path, 'template_filename')
      @generator.should be_instance_of Generator
    end

    #it "has created a Generator bootstrapped with output directory path" do
    #  @generator.output_path().should eql @output_path
    #end
  end
end