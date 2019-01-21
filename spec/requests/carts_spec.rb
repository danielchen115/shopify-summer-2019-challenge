require 'rails_helper'

RSpec.describe 'Carts API', type: :request do
  let(:user) { create(:user) }
  let!(:carts) { create_list(:cart, 10, user_id: user.id) }
  let!(:current_cart) { create(:cart, user_id: user.id, checkout_date: 'null') }
  let(:cart_id) { carts.first.id }
  let(:headers) { valid_headers }

  describe 'GET /carts/history' do
    before { get '/carts/history', params: {}, headers: headers }

    it 'returns all carts' do
      expect(json).not_to be_empty
      expect(json.size).to eq(11)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /carts/current' do
    before { get '/carts/current', params: {}, headers: headers }

    it 'returns carts' do
      expect(json).not_to be_empty
      expect(json.size).to eq(6)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end