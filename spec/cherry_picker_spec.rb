require "spec_helper"

describe CherryPicker do

  before :all do
    @cherry_picker = CherryPicker.new
  end

  describe "#new" do
    it "returns a CherryPicker instance" do
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

  describe "#done" do
    it "should return a hash of its internal content" do
      picker = CherryPicker.new
      picker.start
      result = picker.done
      {"make" => nil, "model" => nil, "thumb" => nil}.should eql result
    end

    it "throws an error if #start was not called first" do
      picker = CherryPicker.new
      expect { picker.done }.should raise_error
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
    it 'throws error when not initialised first, using start' do
      picker = CherryPicker.new
      expect { picker.store 'should not be stored' }.should raise_error
    end

    it "does not store value if #use_thumb, #use_model or #use_make have not been called" do
      picker = CherryPicker.new
      picker.start
      picker.store 'should not be stored'

      for_all_values(picker.done) do |val|
        val.nil?.should be_true
      end
    end

    it "does not store value when #no_store has been called after #use_thumb, #use_model or #use_make" do
      picker = CherryPicker.new
      picker.start
      picker.use_thumb
      picker.no_store
      picker.store 'should not be stored'

      for_all_values(picker.done) do |val|
        val.nil?.should be_true
      end
    end
  end

  describe "#close" do
    it "returns a static poison hash to signify end of xml parsing process" do
      {"end"=>"eof"}.should eql @cherry_picker.close
    end
  end



  private
  def for_all_values (hash, &assertion)
    hash.each do |key, value|
      assertion.call(value)
    end

  end

end