class ValueError < StandardError; end

class Board
  def self.validate(inp_table, row, line)
    raise ValueError if inp_table.map { |each_row| each_row.size }.uniq.size != 1
    if line == 0 || line == inp_table.size-1
      raise ValueError if row.select { |ele| ele != '+' && ele != '-'}.size != 0
    else
      raise ValueError if row.first != '|' || row.last != '|'
      raise ValueError if row.select { |ele| ele != ' ' && ele != '*' && ele != '|'}.size != 0
    end
  end

  def self.transform(inp)
    inp_table = inp.map { |row| row.chars }

    inp_table.map.with_index do |row, x|
      validate(inp_table, row, x)

      row.map.with_index do |ele, y|
        ele == ' ' ? count_mines(inp_table, x, y) : ele
      end.join
    end
  end

  def self.count_mines(inp_table, i, j)
    num = 0
    num += 1 if inp_table[i][j-1] == "*"
    num += 1 if inp_table[i][j+1] == "*"
    num += 1 if inp_table[i-1][j] == "*"
    num += 1 if inp_table[i+1][j] == "*"
    num += 1 if inp_table[i-1][j-1] == "*"
    num += 1 if inp_table[i+1][j-1] == "*"
    num += 1 if inp_table[i-1][j+1] == "*"
    num += 1 if inp_table[i+1][j+1] == "*"
    num == 0 ? ' ' : num
  end
end
