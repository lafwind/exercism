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

  # VERSION = 1

  # def self.of_dna (seq)
  #   rst = ""
  #   seq.each_char do |e|

  #     case e
  #     when 'C' then rst += 'G'
  #     when 'G' then rst += 'C'
  #     when 'T' then rst += 'A'
  #     when 'A' then rst += 'U'
  #     else raise ArgumentError
  #     end

  #   end
  #   rst
  # end

  # def self.of_rna (seq)
  #   rst = ""
  #   seq.each_char do |e|

  #     case e
  #     when 'G' then rst += 'C'
  #     when 'C' then rst += 'G'
  #     when 'A' then rst += 'T'
  #     when 'U' then rst += 'A'
  #     else raise ArgumentError
  #     end

  #   end
  #   rst
  # end
end
