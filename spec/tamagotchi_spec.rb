require 'rspec'
require 'tamagotchi'

describe Tamagotchi  do
  describe "#initialize"  do
    it "sets the name and life levels of a new Tamagotchi"  do
      my_pet = Tamagotchi.new("lil dragon")
      expect(my_pet.name()).to eq("lil dragon")
      expect(my_pet.food_level()).to eq(10)
      expect(my_pet.sleep_level()).to eq(10)
      expect(my_pet.activity_level()).to eq(10)
    end
  end

  describe "#is_alive" do
    before :each do
      @my_pet = Tamagotchi.new("lil dragon")
    end

    it "is alive if the food level is above 0" do
      expect(@my_pet.is_alive()).to eq(true)
    end

    it "is dead if the food level is 0"  do
      @my_pet.set_food_level(0)
      expect(@my_pet.is_alive()).to eq(false)
    end

    it "is dead if sleep level is 0" do
      @my_pet.set_sleep_level(0)
      expect(@my_pet.is_alive()).to eq(false)
    end

    it "is dead if activity level is 0" do
      @my_pet.set_activity_level(0)
      expect(@my_pet.is_alive()).to eq(false)
    end
  end

  describe "#time_passes" do
    before :each do
      @my_pet = Tamagotchi.new("lil dragon")
    end

    it "decreases the amount of food the Tamagotchi has left by the number of units passed in" do
      @my_pet.time_passes(1)  #decide what trigger you will use to make time pass
      expect(@my_pet.food_level()).to eq(9)
    end

    it "decreases the amount of sleep the Tamagotchi has left by the number of units passed in" do
      @my_pet.time_passes(2)
      expect(@my_pet.sleep_level()).to eq(8)
    end

    it "descreases the amout of activity the Tamagotchi has left by the number of units passed in" do
      @my_pet.time_passes(3)
      expect(@my_pet.activity_level()).to eq(7)
    end
  end
end
