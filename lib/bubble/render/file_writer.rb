class FileWriter
  def initialize output_path
    raise ArgumentError, 'FileWriter missing output path' if output_path.nil? || output_path.empty?
    @output_path = output_path
  end
end