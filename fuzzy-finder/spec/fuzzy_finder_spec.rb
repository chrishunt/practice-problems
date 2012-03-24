require 'fuzzy_finder'

describe FuzzyFinder do
  let(:phrase) { 'Fuzzy Bear' }

  describe '#include?' do
    ['Fuzzy', 'fuzzy', 'fzy', 'uzB', 'y r', 'fzyr'].each do |term|
      it "returns true for term '#{term}'" do
        FuzzyFinder.include?(phrase, term).should == true
      end
    end

    ['Fazzy', 'BF', 'Fzyz'].each do |term|
      it "returns false for term '#{term}'" do
        FuzzyFinder.include?(phrase, term).should == false
      end
    end
  end
end
