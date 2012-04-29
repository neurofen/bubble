class Generator

  attr_reader :processor, :bubble_store, :output_path, :file_writer

  def initialize(processor, bubble_store, output_path)
    @processor = processor
    @bubble_store = bubble_store
    @output_path = output_path
  end

  def use file_writer
    @file_writer = file_writer
  end
end