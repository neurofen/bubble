require "spec_helper"

describe ThumbBucket do

  before :all do
    @bucket = ThumbBucket.new
  end

  describe "#new" do
    it "returns a ThumbBucket instance" do
      @bucket.should be_an_instance_of ThumbBucket
    end

    it "instance limit and remaining default to 10" do
      @bucket.limit.should eql 10
      @bucket.remaining.should eql 10
    end

    it "takes a limit of 5 and returns an instance with size and remaining set to 5" do
      actual = ThumbBucket.new 5
      actual.limit.should eql 5
      actual.remaining.should eql 5
    end
  end

  describe "#add" do
    it "adds the first item and shows remaining to be one less than limit" do
      actual = ThumbBucket.new 3
      actual.add "item-one"
      actual.limit.should eql 3
      actual.remaining.should eql 2
    end

    it "adds items from array of size 2 and shows remainig to be 2 less than limit" do
      expected = ["one", "two"]
      bucket = ThumbBucket.new 3
      bucket.add expected
      bucket.remaining.should eql 1
      bucket.contents.should eql expected
    end

    describe "adding more items than the limit" do
      it "stops adding items after limit is reached" do
        actual = ThumbBucket.new 2
        actual.add 'item-one'
        actual.add 'item-two'
        actual.add 'ignored'
        contents = actual.contents
        contents.length.should eql 2
        contents.should eql ['item-one', 'item-two']
      end

      it "only adds items from an array, up to the limit" do
        actual = ThumbBucket.new 3
        actual.add ["one", "two", "three", "four"]
        actual.contents.should eql ["one", "two", "three"]
        actual.remaining.should eql 0
      end
    end
  end

  describe "#contents" do
    it "returns an array of added items" do
      actual = ThumbBucket.new
      actual.add "foo"
      actual.add "baz"
      actual.add "bar"
      actual.contents.should eql ["foo", "baz", "bar"]
    end

  end

end