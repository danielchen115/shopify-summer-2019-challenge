require 'rails_helper'

RSpec.describe 'Carts API', type: :request do
  let(:user) { create(:user) }
  let!(:carts) { create_list(:cart, 10, user_id: user.id) }
  let(:cart_id) { carts.first.id }
  let(:headers) { valid_headers }

  describe 'GET /carts' do
    before { get '/carts', params: {}, headers: headers }

    it 'returns carts' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /carts/:id' do
    before { get "/carts/#{cart_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the cart' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(cart_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:cart_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Cart/)
      end
    end
  end

  describe 'PUT /carts/:id' do
    let(:valid_attributes) { { total_amount: 95.99 }.to_json }

    context 'when the record exists' do
      before { put "/carts/#{cart_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /carts/:id' do
    before { delete "/carts/#{cart_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end