require 'rails_helper'

RSpec.describe 'Products API', type: :request do
  let!(:products) { create_list(:product, 10) }
  let(:product_id) { products.first.id }

  before do
    stub_const("Product::LIMIT", 20)
  end

  describe 'GET /products/:id' do
    before { get "/products/#{product_id}" }

    context 'when the record exists' do
      it 'returns the product' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(product_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:product_id) { 100 }

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Product/)
      end
    end
  end


  describe 'GET all products' do
    before { get '/products' }

    it 'returns products' do
      #product = create(:product)
      expect(json).not_to be_empty
      expect(json['total']).to eq(10)
      expect(json['products'].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end


  describe 'GET products filtered by category' do
    it 'returns brushes products' do
      brush1 = create(:product, category: "brushes")
      brush2 = create(:product, category: "brushes")
      get '/products', params: {:category => 'brushes'}
      expect(json).not_to be_empty
      expect(json['total']).to eq(2)
      expect(json['products'].size).to eq(2)
    end

    it 'returns empty products' do
      get '/products', params: {:category => 'tools'}
      expect(json).not_to be_empty
      expect(json['total']).to eq(0)
      expect(json['products'].size).to eq(0)
    end
  end


  describe 'GET products with pagination' do
    it 'returns the first n products' do
      get '/products', params: {:limit => 6, :page => 1}
      expect(json['total']).to eq(10)
      expect(json['products'].size).to eq(6)
    end

    it 'returns the 2nd n products' do
      get '/products', params: {:limit => 6, :page => 2}
      expect(json).not_to be_empty
      expect(json['total']).to eq(10)
      expect(json['products'].size).to eq(4)
    end
  end

  describe 'GET products sorted by price' do
    before do
      create(:product, price: 1)
      create(:product, price: 10000)
    end

    it 'returns products in acending order' do
      get '/products', params: {:order => 'asc'}
      expect(json['total']).to eq(12)
      expect(json['products'].size).to eq(12)

      expect(json['products'][0]['price']).to eq(1)
      expect(json['products'][-1]['price']).to eq(10000)
    end
  end

  describe 'GET products combining filter and pagination' do
    it 'returns products in acending order' do
      create(:product, price: 8)

      get '/products', params: {:category => 'makeup', :order => 'asc', :limit => 5, :page => 1}
      expect(json['total']).to eq(11)
      expect(json['products'].size).to eq(5)
      expect(json['products'][0]['price']).to eq(8)
    end
  end
end

