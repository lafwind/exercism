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

  StarTable = {
    "mercury" => 0.2408467,
    "venus"   => 0.61519726,
    "mars"    => 1.8808158,
    "jupiter" => 11.862615,
    "saturn"  => 29.447498,
    "uranus"  => 84.016846,
    "neptune" => 164.79132
  }

  def method_missing(name)
    if StarTable.keys.include? (star = name.to_s.split('_').last)
      return self.on_earth / StarTable[star]
    end
    super
  end
end
