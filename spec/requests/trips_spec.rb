require 'rails_helper'

RSpec.describe "Trips", type: :request do
  user = User.create!(email: "user@example.org", password: "very-secret")
  describe "GET /trips" do
    it "lists current user trips" do
      sign_in user
      get trips_path
      expect(response).to be_successful
      expect(response.body).to include('Listing trips')
    end
  end
  describe "GET /trips/new" do
    it "displays trip form" do
      sign_in user
      get new_trip_path
      expect(response).to be_successful
    end
  end
end
