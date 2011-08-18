class Widget < ActiveRecord::Base
  include Sunrise::Models::Widget
  
  attr_accessible :content, :title, :is_visible, :sort_order, 
                  :widget_position_id, :widget_type_id, :structure_id
end
