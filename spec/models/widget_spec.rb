require 'spec_helper'

describe Widget do
  before(:all) do
    @structure = FactoryGirl.create(:structure_page)
    @widget = Widget.new(:title => 'Test', :content => 'Test')
    @widget.structure = @structure
  end
  
  it "should create a new instance given valid attributes" do
    @widget.save!
  end
    
  context "validations" do
    it "should not be valid with invalid title" do
      @widget.title = nil
      @widget.should_not be_valid
    end
    
    it "should not be valid with invalid content" do
      @widget.content = nil
      @widget.should_not be_valid
    end
    
    it "should not be valid with invalid sort_order" do
      @widget.sort_order = 'wrong'
      @widget.should_not be_valid
    end
  end
end
