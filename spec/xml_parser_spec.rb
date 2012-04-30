require "spec_helper"
require 'rubygems'
require 'nokogiri'

include Nokogiri

describe XmlParser do

  before :all do
    @xml_parser = XmlParser.new
  end

  describe "#new" do
    it "returns an XmlParser instance" do
      @xml_parser.should be_an_instance_of XmlParser
    end
  end

  describe "#parse" do
    it "parses xml input file" do
      test_listener = TestListener.new
      callback = TestCallback.new
      callback.add_listener test_listener
      xml_input_path = File.expand_path('../test_input.xml', __FILE__)
      puts "xml_input_path: #{xml_input_path}"
      @xml_parser.parse(xml_input_path, callback)

      test_listener.start.should be 1
      test_listener.close.should be 1
      test_listener.work_start.should be 2
      test_listener.work_end.should be 2
    end
  end

end

class TestListener

  attr_reader :start, :close, :work_start, :work_end

  def initialize
    @start = 0
    @close = 0
    @work_start = 0
    @work_end = 0
  end

  def notify key
    if key == :START
      @start += 1
    elsif key == :WORK_START
      @work_start += 1
    elsif key == :WORK_END
      @work_end += 1
    elsif key == :CLOSE
      @close += 1
    end
  end
end

class TestCallback < XML::SAX::Document
  def add_listener listener
    @listener = listener
  end

  def start_document
    @listener.notify :START
  end

  def start_element(element, attributes = [])
    if element == 'work'
      @listener.notify :WORK_START
    end
  end

  def end_element element
    if element == 'work'
      @listener.notify :WORK_END
    end
  end

  def end_document
    @listener.notify :CLOSE
  end
end