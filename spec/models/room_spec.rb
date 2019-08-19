require 'rails_helper'

RSpec.describe Room, type: :model do
  it "should have a valid factory" do
    room = FactoryBot.build(:room)
    expect(room).to be_valid
  end

  describe "Validators" do

    it "should ensure the presence of room_category" do
      room = FactoryBot.build(:room, room_category: nil)
      expect(room).not_to be_valid
      expect(room.errors[:room_category]).to be_present
    end

    it "should ensure the presence of room_number" do 
        room = FactoryBot.build(:room,room_number: nil)
        expect(room).not_to be_valid
        expect(room.errors[:room_number]).to be_present
    end

    it "should ensure the uniqueness of room_number" do 
       room = FactoryBot.create(:room)
       room = FactoryBot.build(:room,room_number: room.room_number)
       expect(room).not_to be_valid
       expect(room.errors[:room_number]).to be_present
    end

    it "should ensure the presence of description" do 
        room = FactoryBot.build(:room,description: nil)
        expect(room).not_to be_valid
        expect(room.errors[:description]).to be_present
    end


  end



  describe "Associations" do

    it "should belong to a room_category" do
      room_category = FactoryBot.create(:room_category)
      room = FactoryBot.build(:room, room_category: room_category)
      expect(room.room_category).to eq room_category
    end
  end

  # describe "Behavior" do
    # pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  # end
end
