class Matrix
  def initialize(matrix)
    @matrix = matrix
  end

  def rows
    @matrix.split("\n").map do |row|
      row.split.map { |char| char.to_i }
    end
  end

  def columns
    total_columns = @matrix.split("\n").first.split.length
    @matrix.gsub("\n", " ").split.group_by.with_index do |_, idx|
      idx % total_columns
    end.values.map do |column|
      column.map { |char| char.to_i }
    end
  end

  def saddle_points
    max_at_row = []
    rows.each_with_index do |row, row_idx|
      row.each_index do |column_idx|
        max_at_row << [row_idx, column_idx] if row[column_idx] == row.max
      end
    end

    max_at_row.select do |row_idx, column_idx|
      columns[column_idx][row_idx] == columns[column_idx].min
    end
  end
end
