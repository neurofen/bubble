require "spec_helper"

describe BubbleStore do

  before :all do
    @db_path = File.expand_path('../../data/db', __FILE__)
    @store = BubbleStore.new @db_path
  end

  after :each do
    @store.drop
  end

  describe "#new" do
    it "returns a BubbleStore instance" do
      @store.should be_an_instance_of BubbleStore
    end
  end

  describe "#store" do
    it "stores by inserting a record with format {:model => ?, :model => ?, :thumb => ?}" do
      @store.store({:make => :CANNON, :model => :EOS, :thumb => nil})
      @store.get_all_makes.should eql [:CANNON]
    end

    it "stores by updating a record with format {:model => ?, :model => ?, :thumb => ?}" do
      @store.store({:make => :CANNON, :model => :EOS, :thumb => :THUMB})
      @store.store({:make => :CANNON, :model => :EOS, :thumb => :BMUHT})
      @store.get_all_makes.should eql [:CANNON]
      @store.get_models_for(:CANNON).should eql [:EOS]
      @store.get_thumbs_for(:CANNON, :EOS).should eql [:BMUHT, :THUMB]
    end
  end

  describe "#get_all_makes" do
    it "returns all makes sorted" do
      @store.store({:make => :CBA, :model => :EOS, :thumb => :BMUHT})
      @store.store({:make => :BCA, :model => :EOS, :thumb => :TWIG})
      @store.store({:make => :ABC, :model => :EOS, :thumb => :THUMB})
      @store.get_all_makes.should eql [:ABC, :BCA, :CBA]
    end
  end

  describe "#get_models_for" do
    it "returns models for a given, existing make" do
      @store.store({:make => :CANNON, :model => :SEO, :thumb => nil})
      @store.store({:make => :CANNON, :model => :EOS, :thumb => nil})
      @store.store({:make => :CANNON, :model => :OSE, :thumb => nil})
      @store.get_models_for(:CANNON).should eql [:EOS, :OSE, :SEO]
    end
  end

  describe "#get_thumbs_for" do
    it "returns all thumbs related to make and model" do
      @store.store({:make => :CANNON, :model => :EOS, :thumb => :TWIG})
      @store.store({:make => :CANNON, :model => :EOS, :thumb => :THUMB})
      @store.store({:make => :CANNON, :model => :EOS, :thumb => :BMUHT})
      @store.get_thumbs_for(:CANNON, :EOS).should eql [:BMUHT, :THUMB, :TWIG]
    end
  end

end