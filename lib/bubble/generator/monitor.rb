module MONITOR
  def create_progress_monitor
    return ProcessMonitor.new(Spinner.new, MonitorProgressBar.new)
  end
end