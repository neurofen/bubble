require "spec_helper"

describe "Running Processor" do
  it "generates files from input xml" do
    xml_filename = File.expand_path('../test_input.xml', __FILE__)
    output_path = File.expand_path('../../test_out/', __FILE__)
    db_path = File.expand_path('../../data/db', __FILE__)
    Processor.new(xml_filename, output_path, db_path).start
    Dir.glob(File.join(output_path, '**', '*')).select { |file| File.file?(file) }.count.should be 5
  end
end