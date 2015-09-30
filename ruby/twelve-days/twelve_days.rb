class TwelveDays
  Nths = [nil, "first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth",
          "ninth", "tenth", "eleventh", "twelfth"]

  Items = [nil, "a Partridge ", "two Turtle Doves, and ", "three French Hens, ",
           "four Calling Birds, ", "five Gold Rings, ", "six Geese-a-Laying, ",
           "seven Swans-a-Swimming, ", "eight Maids-a-Milking, ", "nine Ladies Dancing, ",
           "ten Lords-a-Leaping, ", "eleven Pipers Piping, ", "twelve Drummers Drumming, "]

  VERSION = 1
  def self.song
    [*1..12].map do |idx|
      line(idx)
    end.join("\n\n") + "\n"
  end

  def self.line(nth)
    "On the #{Nths[nth]} day of Christmas my true love gave to me, " +
      [*1..nth].reverse.map { |idx| Items[idx] }.join +
      "in a Pear Tree."
  end
end
