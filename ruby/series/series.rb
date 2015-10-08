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
  end
end
