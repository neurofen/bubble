
class Ingester

  def initialize(processor, xml_parser, xml_file_path)
    raise ArgumentError, 'Ingestor requires a processor' if processor.nil?
    raise ArgumentError, 'Ingestor requires a XML Parser' if xml_parser.nil?
    raise ArgumentError, 'Expected xml_file_path' if (xml_file_path.nil? || xml_file_path.empty?)

    @processor = processor
    @xml_parser = xml_parser
    @xml_file_path = xml_file_path
  end

  def start
    @xml_parser.parse(@xml_file_path, create_callback)
  end

  private
    def create_callback
      WorkCallbacks.new(CherryPicker.new(@processor))
    end

end