require "load_dictionary"

describe LoadDictionary do
  describe "#perform" do
    subject { LoadDictionary.new.perform }

    it "returns a hash listing words by length" do
      expect(subject[2].last).to eq('wu')
    end

    it "saves all the english words" do
      expect(subject[2].count).to eq(49)
    end
  end
end
