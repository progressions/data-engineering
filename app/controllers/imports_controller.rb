require 'csv'

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
        item = Item.from_tsv(row)
        @items << item
        @revenue += item.item_price.to_i
      end
    end

    @revenue /= 100.0
  end
end
