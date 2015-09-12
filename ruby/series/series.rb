class Series
  def initialize(str)
    @str = str
  end

  def slices(n)
    # Version 2
    raise ArgumentError if n > @str.length

    tmp = @str.chars.map { |e| e.to_i }
    tmp.map.with_index do |e, i|
       tmp[i, n]
    end.reduce([], :<<)[0..tmp.size-n]

    # Version 1

    # rst, i, tmp = [], 0, @str.chars.map { |e| e.to_i }
    # raise ArgumentError if n > tmp.size
    # while i+n-1 < tmp.length
    #   rst << tmp[i..i+n-1]
    #   i += 1
    # end
    # rst
  end
end
