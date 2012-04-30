require "spec_helper"

describe IngesterFactory do

  before :all do
    db_path = File.expand_path('../../data/db', __FILE__)
    @processor = Processor.new('blah', 'blah', db_path)
    @factory = IngesterFactory.new @processor
  end

  describe "#new" do
    it "takes a Processor and returns a new instance" do
      @factory.should be_instance_of IngesterFactory
    end
  end

  #describe "#create_generator_for" do
  #  it "creates an instance of Generator" do
  #    @output_path = 'xml source path'
  #    @generator = @factory.create_generator_for(@output_path, 'template_filename')
  #    @generator.should be_instance_of Generator
  #  end
  #end
end