#!/usr/bin/env ruby

root = File.expand_path('../..', __FILE__)

db_path = File.join(root, %w[data db])

require File.join(root, %w[lib bubble.rb])

input_xml = ARGV.first(2)[0]
output_path = ARGV.first(2)[1]

Processor.new(input_xml, output_path, db_path).start


