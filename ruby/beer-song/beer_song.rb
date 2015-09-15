class BeerSong
  def initialize
  end

  def verses(from, to=nil)
    to ||= from
    tail = from != to ? "\n" : ""

    rst = ""
    from.downto(to) do |nth|
      case nth
      when 0 then
        nth, sec_nth, nth_sub_1, bottle, sec_bottle = "No more", "no more", 99, "bottles", "bottles"
        v = "Go to the store and buy some more"
      when 1 then
        sec_nth, nth_sub_1, bottle, sec_bottle = nth, "no more", "bottle", "bottles"
        v = "Take it down and pass it around"
      when 2 then
        sec_nth, nth_sub_1, bottle, sec_bottle = nth, nth-1, "bottles", "bottle"
        v = "Take one down and pass it around"
      else
        sec_nth, nth_sub_1, bottle, sec_bottle = nth, nth-1, "bottles", "bottles"
        v = "Take one down and pass it around"
      end

      rst += "#{nth} #{bottle} of beer on the wall, #{sec_nth} #{bottle} of beer.\n" +
             "#{v}, #{nth_sub_1} #{sec_bottle} of beer on the wall.\n" + tail
    end

    rst
  end

  def verse(nth)
    verses(nth)
  end

  def sing
    verses(99, 0)
  end
end
