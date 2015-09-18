class Scrabble
  Table = {
    ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'] => 1,
    ['D', 'G'] => 2,
    ['B', 'C', 'M', 'P'] => 3,
    ['F', 'H', 'V', 'W', 'Y'] => 4,
    ['K'] => 5,
    ['J', 'X'] => 8,
    ['Q', 'Z'] => 10
  }

  def self.score(string)
    self.new(string).score
  end

  def initialize(string)
    @string = string ||= ''
  end

  def score
    @string.gsub(/[^A-Za-z]/, '').upcase.chars.map do |chars|
      Table.select { |k, _| k.include? chars }.values
    end.flatten.reduce(0, :+)
  end
end
