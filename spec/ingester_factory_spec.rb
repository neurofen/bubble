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

end