class WidgetType
  def initialize(value)
    @code = value.to_s
  end
  attr_reader :code
  
  def title
    I18n.t(@code, :scope => [:widgets, :type, :title])
  end
  
  define_enum do |builder|
    builder.member :default, :object => new("default")
    builder.member :text, :object => new("text")
  end
end
