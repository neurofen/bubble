require "spec_helper"
require 'fileutils'

describe "Running Processor" do

  before :all do
    @output_path = File.expand_path('../../test_out/', __FILE__)
    delete_all_files_in @output_path
  end

  it "generates files from input xml" do
    xml_filename = File.expand_path('../test_input.xml', __FILE__)
    db_path = File.expand_path('../../data/db', __FILE__)

    Processor.new(xml_filename, @output_path, db_path).start
    Dir.glob(File.join(@output_path, '**', '*')).select { |file| File.file?(file) }.count.should be 5
  end
end

def delete_all_files_in directory
  FileUtils.rm_r Dir.glob("#{directory}/*.html")
end