require 'csv'
require 'purchase'

class ImportsController < ApplicationController
  def new
  end

  def create
    uploaded_file = params[:import]

    @import = Import.new(uploaded_file.read)
  end
end
