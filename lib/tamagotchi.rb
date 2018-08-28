class Tamagotchi
  @@pets = []
  attr_accessor :name, :food_level, :sleep_level, :activity_level, :last_updated, :id

  def initialize(name)
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
    @last_updated = Time.new()
    @id = @@pets.length
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

  def self.find(id)
    (@@pets.select {|pet| pet.id() == id})[0]
  end

  def is_alive()
    (@food_level > 0) & (@sleep_level > 0) & (@activity_level > 0)
  end

  def set_food_level(level)
    if level < 0
      @food_level = 0
    elsif level > 10
      @food_level = 10
    else
      @food_level = level
    end
  end

  def set_sleep_level(level)
    if level < 0
      @sleep_level = 0
    elsif level > 10
      @sleep_level = 10
    else
      @sleep_level = level
    end
  end

  def set_activity_level(level)
    if level < 0
      @activity_level = 0
    elsif level > 10
      @activity_level = 10
    else
      @activity_level = level
    end
  end

  def time_passes(units)
    if is_alive()
      set_food_level(@food_level - units)
      set_sleep_level(@sleep_level - units)
      set_activity_level(@activity_level - units)
    end
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
    unit_size = 1
    units_passed = ((time - @last_updated)/unit_size).floor
    time_passes(units_passed)
    @last_updated = (@last_updated + (unit_size * units_passed))
  end
end
