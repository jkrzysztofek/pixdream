# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_global_search_variable

  def set_global_search_variable
    @q = Pin.ransack(params[:q])
  end
end
