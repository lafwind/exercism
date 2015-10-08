class Complement
  VERSION = 2

  def self.method_missing(name, *args)
    rst, method_name = "", name.to_sym

    args[0].each_char do |e|
      if e == 'C'
        rst += 'G'
      elsif e == 'G'
        rst += 'C'
      elsif method_name == :of_dna && e == 'T'
        rst += 'A'
      elsif method_name == :of_dna && e == 'A'
        rst += 'U'
      elsif method_name == :of_rna && e == 'A'
        rst += 'T'
      elsif method_name == :of_rna && e == 'U'
        rst += 'A'
      else
        raise ArgumentError
      end
    end
    rst
  end
end
