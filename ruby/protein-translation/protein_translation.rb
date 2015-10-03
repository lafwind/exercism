class InvalidCodonError < StandardError; end

class Translation
  Table = {
    ['AUG']                      => 'Methionine',
    ['UUU', 'UUC']               => 'Phenylalanine',
    ['UUA', 'UUG']               => 'Leucine',
    ['UCU', 'UCC', 'UCA', 'UCG'] => 'Serine',
    ['UAU', 'UAC']               => 'Tyrosine',
    ['UGU', 'UGC']               => 'Cystine',
    ['UGG']                      => 'Tryptophan',
    ['UAA', 'UAG', 'UGA']        => 'STOP'
  }

  def self.of_codon(codon)
    protein = Table.select { |k, v| k.include?(codon) }.values[0]
    raise InvalidCodonError if protein.nil?
    protein
  end

  def self.of_rna(strand)
    is_stop = false
    strand.chars.group_by.with_index do |ele, idx|
      idx / 3
    end.values.map do |codon|
      rst = of_codon(codon.join)
      is_stop = rst == 'STOP' ? true : is_stop
      is_stop ? nil : rst
    end.uniq.compact
  end
end
