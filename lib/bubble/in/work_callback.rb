require 'rubygems'
require 'nokogiri'

include Nokogiri

class WorkCallbacks < XML::SAX::Document

  def initialize cherry_picker
    @cherry_picker = cherry_picker
  end

  def start_element(element, attributes = [])
    if element == 'work'
      puts "#{element} started"
      @cherry_picker.start element
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
    @cherry_picker.store val
  end

  def end_element element
    if element == 'work'
      @cherry_picker.done
      puts "#{element} ended"
    end
    #cherry picker push to queue
  end

  def end_document
    @cherry_picker.close
  end
end