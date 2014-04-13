class Import
  attr_accessor :line_items, :gross_revenue

  def initialize(content)
    @gross_revenue = 0
    @line_items = []

    if content.present?
      results = CSV.parse(content, col_sep: "\t")

      headers = results.shift

      results.each do |row|
        purchase = Purchase.new(row)
        @line_items << purchase
        @gross_revenue += purchase.gross_revenue
      end
    end

    @gross_revenue /= 100.0
  end

  def line_items_length
    line_items.try(:length).to_i
  end
end
