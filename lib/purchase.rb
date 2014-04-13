# Service object to record an Item purchased by a Purchaser from a Merchant.
#
# Given a row of data from a Tab-Separated Value file, this class will
# find or create a Purchaser, find or create a Merchant, and create an Item record.
#
class Purchase
  attr_accessor :row

  def initialize(row)
    self.row = row
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

  def purchaser
    unless @purchaser
      Purchaser.where(name: options[:purchaser_name])
    end
    @purchaser
  end
end
