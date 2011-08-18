require 'spec_helper'

describe Sunrise::Widgets::InstallGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path("../../tmp", __FILE__)
#  arguments %w(something)

  before(:all) do
    prepare_destination
    run_generator
  end

  it "should create migration" do
    assert_migration "db/migrate/sunrise_create_widgets.rb" do |migration|
      assert_class_method :up, migration do |up|
        assert_match /create_table/, up
      end
    end
  end
  
  it "should create widgets models" do
    assert_file "app/models/widget.rb"
    assert_file "app/models/widget_type.rb"
    assert_file "app/models/widget_position.rb"
    assert_file "app/sweepers/widget_sweeper.rb"
  end
end
