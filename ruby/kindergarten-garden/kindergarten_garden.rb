class Garden
  Students = %w(Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry)
  Plants = { G: :grass, V: :violets, C: :clover, R: :radishes }

  def initialize(diagram, students = Students)
    @diagram, @students = diagram, students.sort { |a, b| a[0] <=> b[0] }
  end

  def group_plant
    group = @diagram.split("\n").map do |row|
      row.chars.group_by.with_index do |_, idx|
        idx / 2
      end.values
    end
    group.first.zip(group.last).map do |ele|
      ele.first + ele.last
    end
  end

  def find_plants(name)
    group_plant[@students.index(name.capitalize)].map do |plant|
      Plants[plant.to_sym]
    end
  end

  def method_missing(name, *args)
    return self.send(:find_plants, name.to_s) if @students.include?(name.to_s.capitalize)
    super
  end
end
