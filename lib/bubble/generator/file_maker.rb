class FileMaker

  def initialize output_path
    raise ArgumentError, 'Output path missing' if output_path.nil? || output_path.empty?
    @output_path = output_path
  end

  def make_writable filename, render
    File.open("#{@output_path}/#{filename}", 'w+') do |file|
      render.call(file)
    end
  end

end