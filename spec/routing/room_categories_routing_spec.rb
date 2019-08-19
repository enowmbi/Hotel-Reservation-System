require "rails_helper"

RSpec.describe RoomCategoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/room_categories").to route_to("room_categories#index")
    end

    it "routes to #new" do
      expect(:get => "/room_categories/new").to route_to("room_categories#new")
    end

    it "routes to #show" do
      expect(:get => "/room_categories/1").to route_to("room_categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/room_categories/1/edit").to route_to("room_categories#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/room_categories").to route_to("room_categories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/room_categories/1").to route_to("room_categories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/room_categories/1").to route_to("room_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/room_categories/1").to route_to("room_categories#destroy", :id => "1")
    end
  end
end
