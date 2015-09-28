class Allergies
  Allergens =  %w(eggs peanuts shellfish strawberries tomatoes chocolate pollen cats)
  def initialize(score)
    @score = score
  end

  def allergic_to?(food)
    list.include?(food)
  end

  def list
    Allergens.map.with_index do |allergen, idx|
      allergen if @score & (2 ** idx) > 0
    end.compact
  end
end
