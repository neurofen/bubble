require 'progress_bar'

class ProcessMonitor
	def initialize max
	  @progress = ProgressBar.new max, :bar, :counter, :percentage, :eta
	end

	def notify
	  @progress.increment!
	end
end