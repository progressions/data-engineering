# Service object to record an Item purchased by a Purchaser from a Merchant.
#
# Given a row of data from a Tab-Separated Value file, this class will
# find or create a Purchaser, find or create a Merchant, and create an Item record.
#
class Purchase
  attr_accessor :row

  delegate :gross_revenue, to: :item
  delegate :valid?, to: :item

  def initialize(row)
    self.row = row

    item.save
  end

  def options
    unless @options
      item_price = row[2].to_f * 100

      @options = {
        purchaser_name: row[0],
        item_description: row[1],
        item_price: item_price,
        purchase_count: row[3],
        merchant_address: row[4],
        merchant_name: row[5]
      }
    end
    @options
  end

  def item
    unless @item
      @item = Item.new(
        purchaser: purchaser,
        merchant: merchant,
        item_description: options[:item_description],
        item_price: options[:item_price],
        purchase_count: options[:purchase_count]
      )
    end
    @item
  end

  def purchaser
    unless @purchaser
      Purchaser.where(name: options[:purchaser_name]) ||
        Purchaser.create(name: options[:purchaser_name])
    end
    @purchaser
  end

  def merchant
    unless @merchant
      Merchant.where(name: options[:merchant_name]) ||
        Purchaser.create(name: options[:merchant_name], address: options[:merchant_address])
    end
    @merchant
  end
end
