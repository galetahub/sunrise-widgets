class Manage::WidgetsController < Manage::BaseController
  inherit_resources
  defaults :route_prefix => 'manage'

  load_and_authorize_resource :class => Widget
  cache_sweeper :widget_sweeper, :only => [:create, :update, :destroy]
  
  with_options :only => [:index] do |i|
    i.has_scope :with_title, :as => :title
    i.has_scope :with_position, :as => :position
    i.has_scope :with_type, :as => :type
    i.has_scope :with_structure, :as => :structure
  end
  order_by :title, :created_at, :sort_order
  
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
      @widgets = (@widgets || end_of_association_chain).order(search_filter.order).includes(:structure).page(params[:page])
    end
end
