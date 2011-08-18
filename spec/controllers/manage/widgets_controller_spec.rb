require 'spec_helper'

describe Manage::WidgetsController do
  render_views
  
  before(:all) do
    @structure = FactoryGirl.create(:structure_page)
  end
  
  context "administrator" do
    login_admin
    
    it "should render new action" do
      get :new
      response.should be_success
      response.should render_template("new")
    end
    
    it "should create new structure" do
      lambda {
        post :create, :widget => FactoryGirl.attributes_for(:widget)
      }.should change { Widget.count }.by(1)
    end
        
    context "exists widget" do
      before(:each) do
        @widget = FactoryGirl.create(:widget, :structure => @structure)
      end
      
      it "should render index action" do
        get :index
        assigns(:widgets).should include(@widget)
        response.should render_template('index')
      end
      
      it "should render edit action" do
        controller.should_receive :edit
        get :edit, :id => @widget.id
      end
      
      it "should update structure" do
        put :update, :id => @widget.id, :widget => { :title => "Update" }
        assigns(:widget).should be_valid
        assigns(:widget).title.should == 'Update'
        response.should redirect_to(manage_widgets_path)
      end
      
      it "should destroy widget" do
        lambda {
          delete :destroy, :id => @widget.id
        }.should change { Widget.count }.by(-1)
      end
    end
  end
  
  context "anonymous user" do
    user_logout
    
    it "should not render index action" do
      controller.should_not_receive :index
      get :index
    end
    
    it "should not render new action" do
      controller.should_not_receive :new
      get :new
    end
    
    it "should not render create action" do
      controller.should_not_receive :create
      post :create
    end
    
    context "with exists structure" do
      before(:each) do
        @widget = FactoryGirl.create(:widget, :structure => @structure)
      end
      
      it "should not render edit action" do
        controller.should_not_receive :edit
        get :edit, :id => @widget.id
      end
      
      it "should not render update action" do
        controller.should_not_receive :update
        put :update, :id => @widget.id
      end
      
      it "should not render destroy action" do
        controller.should_not_receive :destroy
        delete :destroy, :id => @widget.id
      end
    end
  end
end
