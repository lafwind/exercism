class Bob
  def hey(r)
    if r == r.upcase && r != r.downcase
      'Whoa, chill out!'
    elsif r.end_with?('?')
      'Sure.'
    elsif r.split.empty?
      'Fine. Be that way!'
    else
      'Whatever.'
    end
  end
end
