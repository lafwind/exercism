class SpaceAge
  def initialize(secs)
    @secs = secs
  end

  def seconds
    @secs
  end

  def on_earth
    (@secs.to_f / 60 / 60 / 24 / 365.25).round(2)
  end

  def on_mercury
    self.on_earth  / 0.2408467
  end

  def on_venus
    self.on_earth  / 0.61519726
  end

  def on_mars
    self.on_earth / 1.8808158
  end

  def on_jupiter
    self.on_earth / 11.862615
  end

  def on_saturn
    self.on_earth / 29.447498
  end

  def on_uranus
    self.on_earth / 84.016846
  end

  def on_neptune
    self.on_earth / 164.79132
  end
end
