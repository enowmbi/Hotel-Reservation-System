require 'rails_helper'

RSpec.describe "RoomCategories", type: :request do
  describe "GET /room_categories" do

    it 'returns http status of success' do
      get room_categories_path
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq(Mime[:html])
    end

    it "returns all room categories" do
      2.times do  
        FactoryBot.create(:room_category)
      end
      get "/room_categories.json"
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq(Mime[:json])
      expect(JSON.parse(response.body).size).to eq(RoomCategory.count)
    end

  end

  describe "GET /room_categories/id" do 

    it 'returns http status of success' do 
      room_category = FactoryBot.create(:room_category)
      get room_categories_path(room_category)
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq(Mime[:html])
    end

    it 'returns JSON of room_category with id specified' do 
      room_category = FactoryBot.create(:room_category)
      get "/room_categories/#{room_category.id}.json"
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq(Mime[:json]) 
      expect(JSON.parse(response.body)["name"]).to eq(room_category.name)
    end

  end

  xdescribe "POST /room_categories" do 
  
    describe "with valid params" do 
    before(:each) do 
     room_category = FactoryBot.build(:room_category)
     post create: room_categories_url,params: room_category
    end

    it "returns http status of created" do 
      expect(response).to have_http_status(201)
      expect(response.content_type).to eq(Mime[:html])
    end

    it "returns the last room category created"
       pending
    end

    describe "with invalid params" do 
     pending
    end


  end

end

