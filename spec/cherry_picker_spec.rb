require "spec_helper"

describe CherryPicker do

  before :all do
    @processor = double("Processor")
    @cherry_picker = CherryPicker.new @processor
  end

  describe "#new" do
    it "takes a Processor and returns a CherryPicker instance" do
      @cherry_picker.should be_an_instance_of CherryPicker
    end

    it "returns instance with #is_thumb set to false" do
       @cherry_picker.is_thumb.should be_false
    end

    it "returns instance with #is_model set to false" do
       @cherry_picker.is_model.should be_false
    end

    it "returns instance with #is_make set to false" do
       @cherry_picker.is_make.should be_false
    end
  end

  describe "#use_make" do
    it "#is_make returns true" do
      @cherry_picker.use_make
      @cherry_picker.is_make.should be_true
    end

    it "#is_thumb returns false" do
       @cherry_picker.is_thumb.should be_false
    end

    it "#is_model returns false" do
       @cherry_picker.is_model.should be_false
    end
  end

  describe "#use_model" do
    it "#is_model returns true" do
      @cherry_picker.use_model
      @cherry_picker.is_model.should be_true
    end

    it "#is_thumb returns false" do
       @cherry_picker.is_thumb.should be_false
    end

    it "#is_make returns false" do
       @cherry_picker.is_make.should be_false
    end
  end

  describe "#use_thumb" do
    it "#is_thumb returns true" do
      @cherry_picker.use_thumb
      @cherry_picker.is_thumb.should be_true
    end

    it "#is_model returns false" do
       @cherry_picker.is_model.should be_false
    end

    it "#is_make returns false" do
       @cherry_picker.is_make.should be_false
    end
  end

  describe "#no_store" do
    it "#is_thumb returns false" do
      @cherry_picker.use_thumb
      @cherry_picker.is_thumb.should be_true
      @cherry_picker.no_store
      @cherry_picker.is_thumb.should be_false
    end

    it "#is_model returns false" do
       @cherry_picker.is_model.should be_false
    end

    it "#is_make returns false" do
       @cherry_picker.is_make.should be_false
    end
  end

  describe "#store" do
    it 'throws error when not initialised using #start' do
      picker = CherryPicker.new @processor
      expect { picker.store 'should not be stored' }.should raise_error
    end

    it "does not store value if #use_thumb, #use_model or #use_make have not been called" do
      picker = CherryPicker.new @processor
      picker.start
      picker.store 'should not be stored'
      picker.done
    end

    it "does not store value when #no_store has been called after #use_thumb, #use_model or #use_make" do
      picker = CherryPicker.new @processor
      picker.start
      picker.use_thumb
      picker.no_store
      picker.store 'should not be stored'
      picker.done
    end
  end

  describe "#done" do
    it "calls processor#store when make and model values set" do
      picker = CherryPicker.new @processor
      picker.start
      picker.use_make
      picker.store 'stored as make'
      picker.use_model
      picker.store 'stored as model'
      @processor.should_receive(:store).once
      picker.done
    end

    it "does not call processor#store when make is nil and model is set" do
      picker = CherryPicker.new @processor
      picker.start
      picker.use_make
      picker.store 'stored as make'
      picker.done
    end

    it "does not call processor#store when model is nil and make is set" do
      picker = CherryPicker.new @processor
      picker.start
      picker.use_model
      picker.store 'stored as model'
      picker.done
    end
  end

  describe "#close" do
    it "calls processor#next" do
      @processor.should_receive(:next).once
      CherryPicker.new(@processor).close
    end
  end

  private
  def for_all_values (hash, &assertion)
    hash.each do |key, value|
      assertion.call(value)
    end

  end

end