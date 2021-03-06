require 'rails_helper'

RSpec.describe 'Products API', type: :request do
  let(:user) { create(:user) }
  let!(:products) { create_list(:product, 10) }
  let!(:empty_products) { create_list(:product, 5, inventory_count: 0) }
  let(:product_id) { products.first.id }
  let(:headers) { valid_headers }

  describe 'GET /products including out of stock' do
      before { get '/products', params: {in_stock_only: 0}, headers: headers }

      it 'returns products' do
        expect(json).not_to be_empty
        expect(json.size).to eq(15)
      end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /products excluding out of stock' do
    before { get '/products', params: {in_stock_only: 1}, headers: headers }

    it 'returns products' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /products/:id' do
    before { get "/products/#{product_id}", params: {}, headers: headers }

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
      let(:product_id) { 99999 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Product/)
      end
    end
  end
end
