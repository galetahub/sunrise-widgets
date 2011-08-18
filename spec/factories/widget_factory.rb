FactoryGirl.define do
  factory :widget, :class => Widget do
    title "Test"
    content "Test"
    is_visible true
    sort_order 1
    widget_position_id WidgetPosition.default.id
    widget_type_id WidgetType.default.id
    
    association :structure, :factory => :structure_page
  end
end
