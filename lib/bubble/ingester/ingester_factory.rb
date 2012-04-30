class IngesterFactory

  def initialize processor
    @processor = processor
  end

  def create_ingester_for xml_input_file
    Ingester.new(@processor, XmlParser.new, xml_input_file)
  end

end