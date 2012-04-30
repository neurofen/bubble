class Generator

  attr_reader :processor, :output_path, :file_writer

  def initialize(processor, output_path, file_writer)
    raise ArgumentError, 'Processor missing' if processor.nil?
    raise ArgumentError, 'FileWriter missing' if file_writer.nil?
    raise ArgumentError, 'Output path missing' if output_path.nil? || output_path.empty?
    @processor = processor
    @output_path = output_path
    @file_writer = file_writer
  end

  def start

  end
end