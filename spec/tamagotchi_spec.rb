require 'rspec'
require 'tamagotchi'

describe Tamagotchi  do
  before :each do
    @my_pet = Tamagotchi.new("lil dragon")
  end

  describe "#initialize"  do
    it "sets the name and life levels of a new Tamagotchi"  do
      expect(@my_pet.name()).to eq("lil dragon")
      expect(@my_pet.food_level()).to eq(10)
      expect(@my_pet.sleep_level()).to eq(10)
      expect(@my_pet.activity_level()).to eq(10)
    end
  end

  describe "#set_food_level" do
    it "changes the food level to the level passed in as a parameter" do
      @my_pet.set_food_level(8)
      expect(@my_pet.food_level()).to eq(8)
    end

    it "changes the food level to the level passed in as a parameter" do
      @my_pet.set_food_level(7)
      expect(@my_pet.food_level()).to eq(7)
    end
  end

  describe "#set_sleep_level" do
    it "changes the sleep level to the level passed in as a parameter" do
      @my_pet.set_sleep_level(9)
      expect(@my_pet.sleep_level()).to eq(9)
    end

    it "changes the sleep level to the level passed in as a parameter" do
      @my_pet.set_sleep_level(4)
      expect(@my_pet.sleep_level()).to eq(4)
    end
  end

  describe "#set_activity_level" do
    it "changes the activity level to the level passed in as a parameter" do
      @my_pet.set_activity_level(7)
      expect(@my_pet.activity_level()).to eq(7)
    end

    it "changes the activity level to the level passed in as a parameter" do
      @my_pet.set_activity_level(3)
      expect(@my_pet.activity_level()).to eq(3)
    end
  end

  describe "#is_alive" do
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
    it "decreases the amount of food the Tamagotchi has left by the number of units passed in" do
      @my_pet.time_passes(1)
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

  describe "#eat" do
    it "increases the food level by 1 with a maximum of 10" do
      @my_pet.eat()
      expect(@my_pet.food_level()).to eq(10)
    end

    it "increases the food level by 1 with a maximum of 10" do
      @my_pet.time_passes(1)
      @my_pet.eat()
      expect(@my_pet.food_level()).to eq(10)
    end

    it "increases the food level by 1 with a maximum of 10" do
      @my_pet.time_passes(2)
      @my_pet.eat()
      expect(@my_pet.food_level()).to eq(9)
    end

    it "will not increase the food level if it is not alive" do
      @my_pet.set_food_level(0)
      @my_pet.eat()
      expect(@my_pet.food_level).to eq(0)
    end

    it "will not increase the food level if it is not alive" do
      @my_pet.set_food_level(9)
      @my_pet.set_sleep_level(0)
      @my_pet.eat()
      expect(@my_pet.food_level).to eq(9)
    end
  end

  describe "#sleep" do
    it "increases the sleep level by 1 with a maximum of 10" do
      @my_pet.sleep()
      expect(@my_pet.sleep_level()).to eq(10)
    end

    it "increases the sleep level by 1 with a maximum of 10" do
      @my_pet.time_passes(1)
      @my_pet.sleep()
      expect(@my_pet.sleep_level()).to eq(10)
    end

    it "increases the sleep level by 1 with a maximum of 10" do
      @my_pet.time_passes(2)
      @my_pet.sleep()
      expect(@my_pet.sleep_level()).to eq(9)
    end

    it "will not increase the sleep level if it is not alive" do
      @my_pet.set_sleep_level(0)
      @my_pet.sleep()
      expect(@my_pet.sleep_level).to eq(0)
    end

    it "will not increase the sleep level if it is not alive" do
      @my_pet.set_sleep_level(9)
      @my_pet.set_food_level(0)
      @my_pet.sleep()
      expect(@my_pet.sleep_level).to eq(9)
    end
  end

  describe "#play" do
    it "increases the activity level by 1 with a maximum of 10" do
      @my_pet.play()
      expect(@my_pet.activity_level()).to eq(10)
    end

    it "increases the activity level by 1 with a maximum of 10" do
      @my_pet.time_passes(1)
      @my_pet.play()
      expect(@my_pet.activity_level()).to eq(10)
    end

    it "increases the activity level by 1 with a maximum of 10" do
      @my_pet.time_passes(2)
      @my_pet.play()
      expect(@my_pet.activity_level()).to eq(9)
    end

    it "will not increase the activity level if it is not alive" do
      @my_pet.set_activity_level(0)
      @my_pet.play()
      expect(@my_pet.activity_level).to eq(0)
    end

    it "will not increase the activity level if it is not alive" do
      @my_pet.set_activity_level(8)
      @my_pet.set_sleep_level(0)
      @my_pet.play()
      expect(@my_pet.activity_level).to eq(8)
    end
  end

  describe "#update_vitals" do
    it "will lower the vitals by 1 for every 10 seconds that have passed" do
      update_at = (@my_pet.last_updated() + 10)
      @my_pet.update_vitals(update_at)
      expect(@my_pet.food_level).to eq(9)
      expect(@my_pet.sleep_level).to eq(9)
      expect(@my_pet.activity_level).to eq(9)
    end

    it "will lower the vitals by 1 for every 10 seconds that have passed" do
      update_at = (@my_pet.last_updated() + 21)
      @my_pet.update_vitals(update_at)
      expect(@my_pet.food_level).to eq(8)
      expect(@my_pet.sleep_level).to eq(8)
      expect(@my_pet.activity_level).to eq(8)
    end
  end
end
