require "spec_helper"

describe Processor do

  before :all do
    xml_input_path = File.expand_path('../test_input.xml', __FILE__)
    db_path = File.expand_path('../../data/db', __FILE__)
    output_path = '/tmp'
    @processor = Processor.new(xml_input_path, output_path, db_path)
  end

  describe "#new" do
    it "takes an xml_filename, output_path and db_path and returns a Processor instance" do
      @processor.should be_an_instance_of Processor
    end
  end

end