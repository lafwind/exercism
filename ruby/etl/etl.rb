class ETL
  def self.transform(old)

    old.to_a.map do |e|
      e.last.map { |k| [k.downcase, e.first] }
    end.flatten(1).to_h
  end
end
