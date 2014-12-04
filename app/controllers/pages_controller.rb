# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  include HighVoltage::StaticPage

  before_filter :current_user
  layout :layout_for_page

  private

  def layout_for_page
    case params[:id]
      when 'home'
        'home'
      else
        'application'
    end
  end
end