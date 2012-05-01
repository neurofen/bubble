require 'rubygems'
require 'nokogiri'

include Nokogiri

class WorkCallbacks < XML::SAX::Document

  def initialize cherry_picker
    @cherry_picker = cherry_picker
  end

  def start_document
    @cherry_picker.start
  end

  def start_element(element, attributes = [])
    if element == 'work'
      puts "#{element} started"
      @cherry_picker.start
    elsif element == 'url' && attributes[0][1] == 'small'
      @cherry_picker.use_thumb
    elsif element == 'model'
      @cherry_picker.use_model
    elsif element == 'make'
      @cherry_picker.use_make
    else
      @cherry_picker.no_store
    end
  end

  def characters val
    @cherry_picker.store val.gsub(/\r\n?/, "")
  end

  def end_element element
    if element == 'work'
      puts "#{element} ended"
      @cherry_picker.done
    else
      @cherry_picker.no_store
    end
  end

  def end_document
    @cherry_picker.close
  end
end