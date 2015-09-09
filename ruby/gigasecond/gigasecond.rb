class Gigasecond
  VERSION = 1

  def self.from (t)
    Time.at(t.to_f + 10**9).utc
  end
end
