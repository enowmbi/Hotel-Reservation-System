require 'rails_helper'

RSpec.describe RoomCategory, type: :model do
  it "should have a valid factory" do
    room_category = FactoryBot.build(:room_category)
    expect(room_category).to be_valid
  end

  describe "Validators" do

    it "should ensure the presence of name" do 
      room_category = FactoryBot.build(:room_category,name:nil)
      expect(room_category).not_to be_valid
      expect(room_category.errors[:name]).to be_present
    end

    it "should ensure the uniqueness of name" do 
      room_category = FactoryBot.create(:room_category)
      room_category = FactoryBot.build(:room_category,name: room_category.name)
      expect(room_category).not_to be_valid
      expect(room_category.errors[:name]).to be_present
    end

    it "should ensure the presence of description" do 
      room_category = FactoryBot.build(:room_category,description: nil)
      expect(room_category).not_to be_valid
      expect(room_category.errors[:description]).to be_present
    end

    it "should ensure the presence of price" do 
      room_category = FactoryBot.build(:room_category,price: nil)
      expect(room_category).not_to be_valid
      expect(room_category.errors[:price]).to be_present
    end

  end

  describe "Associations" do 
  
    it "should allow multiple rooms" do
      room_category = FactoryBot.create(:room_category)

      3.times.each do |n|
      room = FactoryBot.create(:room)
      room_category.rooms << room
      room_category_rooms = room_category.rooms
      expect(room_category_rooms.count).to eq n.next
      expect(room_category_rooms).to include room
    end
  end

end

  describe "Graceful Destroyal" do

    it "should destroy the associated rooms when deleted" do
      room_category = FactoryBot.create(:room_category)
      room_category.rooms.create(FactoryBot.attributes_for(:room))

      expect{ room_category.destroy }.to change(Room, :count).by(-1)
    end

  end



  # describe "Behavior" do
  # pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  # end
end
