require "spec_helper"


describe Ingester do

  before :all do
    db_path = File.expand_path('../../data/db', __FILE__)
    @xml_file_path = 'blah'
    @processor = double("Processor")
    @xml_parser = double("XmlParser")
    @ingester = Ingester.new(@processor ,@xml_parser, @xml_file_path)
  end

  describe "#new" do
    it "takes Processor, XmlParser, and xml_file_path and returns a Ingester instance" do
      @ingester.should be_an_instance_of Ingester
    end

    it "throws an error when instantiated without a Processor" do
      expect { Ingester.new(nil ,@xml_parser, @xml_file_path) }.should raise_error
    end

    it "throws an error when instantiated without an XmlParser" do
      expect { Ingester.new(@processor ,nil, @xml_file_path) }.should raise_error
    end

    it "throws an error when instantiated without an xml_file_path" do
      expect { Ingester.new(@processor ,@xml_parser, nil) }.should raise_error
    end
  end

  describe "#start" do
    it "calls XmlParser#parse once with path and callback" do
      @xml_parser.should_receive(:parse).once.with(@xml_file_path, kind_of(WorkCallbacks))
      @ingester.start
    end
  end

end