class School
  def initialize
    @school = {}
  end

  def to_hash
    @school
  end

  def add(name, class_name)
    @school[class_name] =
      if @school[class_name].nil?
        [name]
      else
        @school[class_name].push(name).sort{ |a, b| a <=> b }
      end
    @school = @school.to_a.sort { |a, b| a.first <=> b.first }.to_h
  end

  def grade(class_name)
    @school[class_name] ||= []
  end
end
