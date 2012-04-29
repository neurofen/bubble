require "spec_helper"
require "erb"

describe DataTemplateBinder do
  template =
      <<tmpl
  <ul>
  <% @navigation.each do |nav| %>
    <li><%= nav %></li>
  <% end %>
  </ul>
tmpl


  before :all do
    @templateBinder = DataTemplateBinder.new template
  end

  describe "#new" do
    it "takes a template as string and returns a Make instance" do
      @templateBinder.should be_an_instance_of DataTemplateBinder
    end

    it "throws an error when instantiated without a template" do
      expect { DataTemplateBinder.new }.should raise_error
    end

    it "throws an error when instantiated with an empty string" do
      expect { DataTemplateBinder.new "" }.should raise_error
    end
  end

  describe "#generator" do
    it "renders data object bound to template, as expected" do
      actual = @templateBinder.render TestData.new ['one', 'two', 'three']
      actual.gsub(/\s+/, '').should eql  "<ul><li>one</li><li>two</li><li>three</li></ul>"
    end

    it "throws an error when nil is passed" do
      expect {@templateBinder.render nil}.should raise_error
    end

  end
end

class TestData

  def initialize(navs=[])
    @navigation = navs
  end

  def get_binding
    binding
  end
end