require "spec_helper"

describe ProcessMonitor do

  before :all do
    @spinner = double('Spinner')
    @progress_bar = double('MonitorProgressBar')

    @process_monitor = ProcessMonitor.new @spinner, @progress_bar
  end

  describe "#new" do
    it "takes a Spinner and MonitorProgressBar to return a ProcessMonitor instance" do
      @process_monitor.should be_an_instance_of ProcessMonitor
    end
  end

  describe "#start" do
    it "calls start on Spinner when :SPINNER is passed" do
      @spinner.should_receive(:start).once
      @process_monitor.start :SPINNER
    end

    it "calls start with a value on MonitorProgressBar when :BAR is passed" do
      max_size = 10
      @progress_bar.should_receive(:start).once.with max_size
      @process_monitor.start :BAR, max_size
    end

    it "raises an error when called with an unrecognized type" do
      expect {@process_monitor.start 10 }.should raise_error
    end

  end

  describe "#stop" do
    it "calls stop on Spinner when :SPINNER is passed" do
      @spinner.should_receive(:stop).once
      @process_monitor.stop :SPINNER
    end

    it "does not call stop on MonitorProgressBar when :BAR is passed" do
      @process_monitor.stop :BAR
    end
  end

  describe "#notify" do
    it "calls notify on MonitorProgressBar when called with :BAR" do
      @progress_bar.should_receive(:notify).once
      @process_monitor.notify :BAR
    end

    it "ignores types other than :BAR" do
      @process_monitor.notify :WTF
    end
  end

  describe "#total_time" do
    it "returns a formated time hh:mm:ss when called" do
      @process_monitor.total_time.should eql "00:00:00"
    end
  end

end