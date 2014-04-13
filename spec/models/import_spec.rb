require 'spec_helper'

describe Import do
  before(:each) do
    content = File.read("#{Rails.root}/example_input.tab")
    @import = Import.new(content)
  end

  it 'calculates gross revenue' do
    expect(@import.gross_revenue).to eq(95.0)
  end

  it 'calculates number of line items' do
    expect(@import.line_items_length).to eq(4)
  end

  it 'creates 4 line items' do
    expect(LineItem.count).to eq(4)
  end

  it 'creates 3 items' do
    expect(Item.count).to eq(3)
  end

  it 'creates 3 merchants' do
    expect(Merchant.count).to eq(3)
  end

  it 'creates 3 purchasers' do
    expect(Purchaser.count).to eq(3)
  end
end
