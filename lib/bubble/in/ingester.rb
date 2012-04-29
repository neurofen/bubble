
class Ingester

  def initialize processor
    raise ArgumentError, 'Ingestor requires a processor' if processor.nil?
    raise ArgumentError, 'Expected Processor type' if (Processor != processor.class)
    @processor = processor
  end

  def startIngesting xml_file_path
    true
  end

  #private
  #
  #start queue
  #start ingestion
  #notify processor
end