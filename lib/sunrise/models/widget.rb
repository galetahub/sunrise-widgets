# encoding: utf-8
module Sunrise
  module Models
    module Widget
      def self.included(base)
        base.send :include, InstanceMethods
        base.send :extend,  ClassMethods
      end
      
      module ClassMethods
        def self.extended(base)
          base.class_eval do
            belongs_to :structure
            
            enumerated_attribute :widget_type
            enumerated_attribute :widget_position
            
            validates_presence_of :title, :content
            validates_numericality_of :sort_order, :only_integer => true, :allow_nil => true
	          
	          scope :sortable, order("#{quoted_table_name}.sort_order DESC")
	          scope :recently, order("#{quoted_table_name}.created_at DESC")
	          scope :visible, where(:is_visible => true)
	          scope :with_type, lambda { |type| where(:widget_type_id => type.try(:id) || type) }
	          scope :with_position, lambda { |position| where(:widget_position_id => position.try(:id) || position) }
	          scope :with_title, lambda {|title| where(["#{quoted_table_name}.title LIKE ?", "%#{title}%"]) }
	          scope :with_structure, lambda {|structure| where(["#{quoted_table_name}.structure_id = ?", structure]) }
          end
        end
      end
      
      module InstanceMethods
      
        def content_without_html
          return nil if self.content.blank?
          self.content.no_html
        end
      end
    end
  end
end
