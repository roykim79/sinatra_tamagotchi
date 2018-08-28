class Tamagotchi
  @@pets = []
  attr_accessor :name, :food_level, :sleep_level, :activity_level, :last_updated

  def initialize(name)
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
    @last_updated = Time.new()
  end

  def save()
    @@pets.push(self)
  end

  def self.all()
    @@pets
  end

  def self.clear()
    @@pets = []
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
    if is_alive()
      unless @food_level == 10
        set_food_level(@food_level + 1)
      end
    end
  end

  def sleep()
    if is_alive()
      unless @sleep_level == 10
        set_sleep_level(@sleep_level + 1)
      end
    end
  end

  def play()
    if is_alive()
      unless @activity_level == 10
        set_activity_level(@activity_level + 1)
      end
    end
  end

  def update_vitals(time)
    unit_size = 10
    units_passed = ((time - @last_updated)/unit_size).floor
    time_passes(units_passed)
    @last_updated = (@last_updated + (unit_size * units_passed))
  end
end
