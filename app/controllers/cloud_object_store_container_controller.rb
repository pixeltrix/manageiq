class CloudObjectStoreContainerController < ApplicationController
  before_action :check_privileges
  before_action :get_session_data
  after_action :cleanup_action
  after_action :set_session_data

  include Mixins::GenericListMixin
  include Mixins::GenericShowMixin

  def breadcrumb_name(_model)
    ui_lookup(:tables => "cloud_object_store_container")
  end

  # handle buttons pressed on the button bar
  def button
    @edit = session[:edit] # Restore @edit for adv search box
    params[:page] = @current_page unless @current_page.nil? # Save current page for list refresh
    return tag("CloudObjectStoreContainer") if params[:pressed] == 'cloud_object_store_container_tag'
  end

  def self.display_methods
    %w(cloud_object_store_objects)
  end

  private

  def get_session_data
    @title      = _("Cloud Object Store Containers")
    @layout     = "cloud_object_store_container"
    @lastaction = session[:cloud_object_store_container_lastaction]
    @display    = session[:cloud_object_store_container_display]
    @filters    = session[:cloud_object_store_container_filters]
    @catinfo    = session[:cloud_object_store_container_catinfo]
    @showtype   = session[:cloud_object_store_container_showtype]
  end

  def set_session_data
    session[:cloud_object_store_container_lastaction] = @lastaction
    session[:cloud_object_store_container_display]    = @display unless @display.nil?
    session[:cloud_object_store_container_filters]    = @filters
    session[:cloud_object_store_container_catinfo]    = @catinfo
    session[:cloud_object_store_container_showtype]   = @showtype
  end

  menu_section :ost
end
