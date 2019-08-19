require 'rails_helper'

RSpec.describe "RoomCategories", type: :request do
  describe "GET /room_categories" do
    it "works! (now write some real specs)" do
      get room_categories_path
      expect(response).to have_http_status(200)
    end
  end
end
