class Manage::WidgetsController < Manage::BaseController
  inherit_resources
  defaults :route_prefix => 'manage'
  
  before_filter :make_filter, :only=>[:index]

  load_and_authorize_resource :class => Widget
  
  cache_sweeper :widget_sweeper, :only => [:create, :update, :destroy]
  
  def create
    create!{ manage_widgets_path }
  end
  
  def update
    update!{ manage_widgets_path }
  end
  
  def destroy
    destroy!{ manage_widgets_path }
  end
  
  protected
    
    def collection
      @widgets = (@widgets || end_of_association_chain).merge(@search.scoped).includes(:structure).page(params[:page])
    end
    
    def make_filter
      @search = Sunrise::ModelFilter.new(Widget, :attributes => [:title, :widget_position_id, :widget_type_id])
      @search.update_attributes(params[:search])
    end
end
