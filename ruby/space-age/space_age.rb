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
    "venus" => 0.61519726,
    "mars" => 1.8808158,
    "jupiter" => 11.862615,
    "saturn" => 29.447498,
    "uranus" => 84.016846,
    "neptune" => 164.79132
  }

  def self.calc_how_old_of(star)
    define_method ("on_" + star).to_sym do
      self.on_earth / StarTable[star]
    end
  end

  StarTable.keys.each do |star|
    self.calc_how_old_of(star)
  end
end
