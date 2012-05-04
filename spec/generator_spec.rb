require "spec_helper"


describe Generator do

  before :each do
    @processor = double("Processor")
    @file_writer = double("FileWriter")
    @view_helper = double("ViewHelper")
    @processor.should_receive(:bubble_store).once
    @generator = Generator.new(@processor, @file_writer, @view_helper)
  end

  describe "#new" do
    it "takes a template renderer and file writer and returns a Generator instance" do
      @generator.should be_an_instance_of Generator
    end

    it "throws an error when instantiated with nil Processor" do
      expect { Generator.new(nil, @file_writer, @view_helper) }.should raise_error
    end

    it "throws an error when instantiated with nil FileWriter" do
      expect { Generator.new(@processor, nil, @view_helper) }.should raise_error
    end

    it "throws an error when instantiated with nil ViewHelper" do
      expect { Generator.new(@processor, @file_writer, nil) }.should raise_error
    end
  end

  describe "#start" do
    it "should call repository once and filewriter once, to create index page, when the repository is empty" do
      bubble_store = double("BubbleStore")
      bubble_store.should_receive(:get_all_makes).once.and_return([])
      stubbed_processor = StubbedProcessor.new bubble_store, nil
      @view_helper.should_receive(:create_page_for).once.and_return(lambda{|a,b, c| return [[1][2]]})
      @file_writer.should_receive(:write_to_page).once
      Generator.new(stubbed_processor, @file_writer, @view_helper).start
    end
  end

end

class StubbedProcessor
  attr_accessor :bubble_store

  def initialize bubble_store, monitor
    @bubble_store = bubble_store
    @monitor = monitor
  end

  def monitor anything
    return @monitor
  end

  def done

  end

end