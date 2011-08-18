class SunriseCreateWidgets < ActiveRecord::Migration
  def self.up
    create_table :widgets do |t|
      t.integer :structure_id
      t.string :title, :null => false
      t.text :content
      
      t.boolean :is_visible, :default => true
      t.integer :sort_order, :default => 0
      t.integer :widget_type_id, :limit => 1, :default => 0
      t.integer :widget_position_id, :limit => 1, :default => 0
      
      t.timestamps
    end
    
    add_index :widgets, :structure_id
    add_index :widgets, :widget_position_id
    add_index :widgets, :widget_type_id
  end

  def self.down
    drop_table :widgets
  end
end
