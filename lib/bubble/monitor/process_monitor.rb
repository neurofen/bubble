class ProcessMonitor
	def initialize spinner, progress_bar
      @spinner = spinner
      @progress_bar = progress_bar
      @start = Time.now
    end

    def start type, val=false
      case type
        when :SPINNER
          start_spinner
        when :BAR
          start_progress_bar val
        else
          raise "Monitor type [ #{type} ] unrecognized"
      end
    end

    def stop type
      stop_spinner if type == :SPINNER
    end

	def notify type
	  notify_progress_bar if type == :BAR
    end

    def total_time
      duration = Time.now - @start
      "%02i:%02i:%02i" % [duration/3600, duration%3600/60, duration%60]
    end

  private
    def start_spinner
        @spinner.start
    end

    def stop_spinner
      @spinner.stop
    end

    def start_progress_bar max_size
      @progress_bar.start max_size
    end

    def notify_progress_bar
      @progress_bar.notify
    end
end