require 'csv'

class ImportsController < ApplicationController
  def new
  end

  def create
    uploaded_file = params[:import]
    if uploaded_file.present?
      results = CSV.parse(uploaded_file.read, col_sep: "\t")

      headers = results.shift
      results.each do |row|
      end
    end
  end
end
