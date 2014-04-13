require 'csv'
require 'purchase'

class ImportsController < ApplicationController
  def new
  end

  def create
    uploaded_file = params[:import]

    @revenue = 0
    @items = []

    if uploaded_file.present?
      results = CSV.parse(uploaded_file.read, col_sep: "\t")

      headers = results.shift

      results.each do |row|
        purchase = Purchase.new(row)
        @items << purchase
        @revenue += purchase.gross_revenue
      end
    end

    @revenue /= 100.0

    @import = Import.new(uploaded_file.read)
  end
end
