require 'rails_helper'

RSpec.describe RestaurantsController, type: :controller do
  fixtures :restaurants

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      restaurant = Restaurant.create(name: 'Example Restaurant', address: '123 Main St')
      get :show, params: { id: restaurant.id }
      expect(response).to be_successful
    end

    it 'returns a 404 response for non-existent restaurant' do
      get :show, params: { id: 12345 }
      puts response.body
      expect(response).to have_http_status(404)
    end
  end

  describe 'POST #create' do
    it 'creates a new restaurant' do
      expect {
        post :create, params: { restaurant: { name: 'New Restaurant', address: '123 Main St' } }
      }.to change(Restaurant, :count).by(1)
      expect(response).to have_http_status(201)
    end

    it 'returns an error for invalid restaurant params' do
      post :create, params: { restaurant: { name: nil, address: nil } }
      response_body = JSON.parse(response.body)

      puts response.body
      expect(response).to have_http_status(422)
      expect(response_body['error']).to be_present
    end
  end
end