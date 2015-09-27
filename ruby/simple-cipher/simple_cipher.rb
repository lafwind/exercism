class Cipher
  Chars = [*'a'..'z']
  attr_reader :key

  def initialize(key = create_key)
    @key = key
    validate
  end

  def validate
    raise ArgumentError unless key.chars.all? { |ele| Chars.include? ele } &&
                               key.length > 0
  end

  def do_code(plaintext)
    raise ArgumentError unless block_given?
    plaintext.chars.map.with_index do |char, idx|
      Chars[yield(char, idx)]
    end.join
  end

  def encode(plaintext)
    do_code(plaintext) { |char, idx| (Chars.index(char) + shift_array[idx]) % 26 }
  end

  def decode(plaintext)
    do_code(plaintext) { |char, idx| Chars.index(char) - shift_array[idx] }
  end

  def shift_array
    key.chars.map { |char| Chars.index(char) }
  end

  def create_key
    100.times.map { Chars.sample }.join
  end
end
