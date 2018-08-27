class Tamagotchi
  attr_accessor :name, :food_level, :sleep_level, :activity_level

  def initialize(name)
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
    @last_updated = Time.new()
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

  def time_passes(units)
    set_food_level(@food_level - units)
    set_sleep_level(@sleep_level - units)
    set_activity_level(@activity_level - units)
  end

  def eat()
    unless @food_level == 10
      set_food_level(@food_level + 1)
    end
  end

  def sleep()
    unless @sleep_level == 10
      set_sleep_level(@sleep_level + 1)
    end
  end

  def play()
    unless @activity_level == 10
      set_activity_level(@activity_level + 1)
    end
  end

end
