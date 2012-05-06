require 'thread'

Thread.abort_on_exception = true

class Spinner
  GLYPHS = ['|', '/', '-', "\\", '|', '/', '-', "\\"]

  def initialize
    @start = false
  end

  def start
    @start = true
    @t = Thread.new do
      while @start
        GLYPHS.each do |glyph|
          print "\r#{glyph}"
          sleep 0.15
        end
      end
      print "\r"
    end
  end

  def stop
    @start = false
    @t.join
  end
end