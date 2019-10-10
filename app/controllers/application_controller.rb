class ApplicationController < ActionController::Base
  include DeviseWhitelist
  before_action :set_source

  def set_source
    # by passing "?q=twitter" in the URL, params picks up a new key/value pair.
    # below, we create a new session hash called "source" and set it to the param "q"
    session[:source] = params[:q] if params[:q]
  end
end
