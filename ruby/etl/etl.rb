class ETL
  def self.transform(old)

    old.to_a.map do |e|
      e.last.map { |k| [k.downcase, e.first] }
    end.flatten(1).to_h

    # Version 1
    # tmp = []
    # old.to_a.each do |e|
    #   e.last.each do |x|
    #     tmp << [x.downcase, e.first]
    #   end
    # end
    # tmp.to_h
  end
end
