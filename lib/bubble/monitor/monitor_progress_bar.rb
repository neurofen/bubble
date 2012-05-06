require 'progress_bar'

class MonitorProgressBar

  def start max_size
    @progress = ProgressBar.new(max_size, :bar, :counter, :percentage, :eta) unless !@progress.nil?
  end

  def notify
    @progress.increment!
  end

end