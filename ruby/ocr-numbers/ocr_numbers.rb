class OCR
  NumTable = {
      [' _ ', '| |', '|_|'] => '0',
      ['   ', '  |', '  |'] => '1',
      [' _ ', ' _|', '|_ '] => '2',
      [' _ ', ' _|', ' _|'] => '3',
      ['   ', '|_|', '  |'] => '4',
      [' _ ', '|_ ', ' _|'] => '5',
      [' _ ', '|_ ', '|_|'] => '6',
      [' _ ', '  |', '  |'] => '7',
      [' _ ', '|_|', '|_|'] => '8',
      [' _ ', '|_|', ' _|'] => '9'
    }

  NumTable.default = '?'

  def initialize(text)
    @text = text
  end

  def convert
    step_0 = @text.split("\n").map do |ele|
      ele.chars.group_by.with_index do |_, idx|
        idx / 3
      end.values
    end

    total_counts = step_0.first.length

    step_1 = step_0.flatten(1).map do |ele|
      [ele.join]
    end

    step_2 = step_1.group_by.with_index do |_, idx|
      idx % total_counts
    end

    step_2.values.map(&:flatten).map do |ele|
      NumTable[ele]
    end.join
  end
end
