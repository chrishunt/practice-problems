class FuzzyFinder
  def self.include?(phrase, term)
    term.downcase.split('').inject(0) do |previous, c|
      index = phrase.downcase.index(c)
      return false unless index && index >= previous
      previous = index
    end
    true
  end
end
