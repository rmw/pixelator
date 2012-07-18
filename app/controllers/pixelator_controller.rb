class PixelatorController < ApplicationController
  layout false

  respond_to :js
  caches_page :data

  def data
    render
  end
end
