require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:sale_price) }
  it { should validate_numericality_of(:price) }
  it { should validate_numericality_of(:sale_price) }

  it "returns filtered products" do
    create_list(:product, 10)
    mak = create(:product, price: 1)

    total, products = Product.get_by_filter("makeup", 5, 1, "asc")
    expect(total).to eq(11)
    expect(products.size).to eq(5)
    expect(products.first.id).to eq(mak.id)
  end
end
