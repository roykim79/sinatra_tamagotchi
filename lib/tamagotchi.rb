class Tamagotchi
  attr_accessor :name, :food_level, :sleep_level, :activity_level

  def initialize(name)
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
  end

  def is_alive()
    (@food_level > 0) & (@sleep_level > 0) & (@activity_level > 0)
  end

  def set_food_level(level)
    @food_level = level
  end

  def set_sleep_level(level)
    @sleep_level = level
  end

  def set_activity_level(level)
    @activity_level = level
  end

  def time_passes()
    set_food_level(@food_level - 1)
    set_sleep_level(@sleep_level - 1)
    set_activity_level(@activity_level - 1)
  end
end
