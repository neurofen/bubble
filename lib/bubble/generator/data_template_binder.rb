require "erb"

class DataTemplateBinder

  def initialize(template)
    raise ArgumentError, 'Template content is empty' if template.nil? || template.empty?
    @renderer = ERB.new(template, nil, "%<>")
  end

  def render display_data
    raise ArgumentError, 'Attempt to bind template to nil' if display_data.nil?
    @renderer.result display_data.get_binding
  end

end