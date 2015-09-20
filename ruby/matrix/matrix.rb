class Matrix
  def initialize(matrix_string)
    @matrix_string = matrix_string
  end

  def rows
    @matrix_string.split("\n").map do |row|
      row.split.map { |ele| ele.to_i }
    end
  end

  def columns
    total_columns = @matrix_string.split("\n").first.split.length

    @matrix_string.gsub("\n", ' ').split.group_by.with_index do |_, idx|
      idx % total_columns
    end.values.map do |column|
      column.map { |ele| ele.to_i }
    end
  end
end
