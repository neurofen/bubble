require 'rubygems'
require 'nokogiri'

include Nokogiri

class XmlParser

  def parse(xml_path, callback)
    parser = XML::SAX::Parser.new(callback)
    parser.parse_file(xml_path)
  end

end