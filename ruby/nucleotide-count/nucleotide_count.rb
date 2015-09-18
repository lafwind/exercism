class Nucleotide
  DNA_GROUP = ['A', 'T', 'C', 'G']

  def self.from_dna(string)
    raise ArgumentError if (string.chars - DNA_GROUP).length != 0
    self.new(string)
  end

  def initialize(string)
    @string = string
  end

  def count(chars)
    @string.gsub(/[^#{chars}]/, '').length
  end

  def histogram
    DNA_GROUP.map { |char| [char, self.count(char)] }.to_h
  end
end
