class WidgetPosition
  def initialize(value)
    @code = value.to_s
  end
  attr_reader :code
  
  def title
    I18n.t(@code, :scope => [:widgets, :position, :title])
  end
  
  define_enum do |builder|
    builder.member :default, :object => new("default")
  end
end
