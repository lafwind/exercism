class Crypto
  def initialize(str)
    @str = str
  end

  def normalize_plaintext
    @str.gsub(/\W/, "").downcase.split.join
  end

  def size
    Math.sqrt(self.normalize_plaintext.length).ceil
  end

  def plaintext_segments
    text = self.normalize_plaintext
    range = (text.length.to_f / self.size).ceil

    [*1..range].map.with_index do |ele, idx|
      text[idx*self.size, self.size]
    end
  end

  def group_it
    self.normalize_plaintext.chars.group_by.with_index do |_, idx|
      idx % self.size
    end.values
  end

  def ciphertext
    self.group_it.flatten.join
  end

  def normalize_ciphertext
    self.group_it.map(&:join).join(" ")
  end
end
