# Service object to record an Item purchased by a Purchaser from a Merchant.
#
# Given a row of data from a Tab-Separated Value file, this class will
# find or create a Purchaser, find or create a Merchant, and create an Item record.
#
class Purchase
  attr_accessor :row

  delegate :gross_revenue, to: :line_item
  delegate :valid?, to: :line_item

  def initialize(row)
    self.row = row

    line_item.save
  end

  def options
    unless @options
      price = row[2].to_f * 100

      @options = {
        purchaser_name: row[0],
        description: row[1],
        price: price,
        purchase_count: row[3],
        merchant_address: row[4],
        merchant_name: row[5]
      }
    end
    @options
  end

  def line_item
    unless @line_item
      @line_item = LineItem.new(
        purchaser: purchaser,
        merchant: merchant,
        item: item,
        purchase_count: options[:purchase_count]
      )
    end
    @line_item
  end

  def item
    unless @item
      @item = Item.where(description: options[:description], price: options[:price]).first ||
        Item.new(
        description: options[:description],
        price: options[:price]
      )
    end
    @item
  end

  def purchaser
    unless @purchaser
      @purchaser = Purchaser.where(name: options[:purchaser_name]).first ||
        Purchaser.create(name: options[:purchaser_name])
    end
    @purchaser
  end

  def merchant
    unless @merchant
      @merchant = Merchant.where(name: options[:merchant_name]).first ||
        Merchant.create(name: options[:merchant_name], address: options[:merchant_address])
    end
    @merchant
  end
end
