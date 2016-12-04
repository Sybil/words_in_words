require "generalized_split_words"

describe GeneralizedSplitWords do
  describe "#perform" do
    subject { GeneralizedSplitWords.new(dictionary, words_size).perform }

    let(:dictionary) do 
      {
        3 => ['ook', 'lol', 'mdr'],
        6 => ['lolmdr'],
        9 => ['lollolmdr']
      }
    end
    let(:words_size) { 9 }

    it "splits words of the given size" do
      expect(subject['lollolmdr']).to eq([['lol', 'lolmdr'], ['lol', 'lol', 'mdr']])
    end

    it "doesn't split words of different size" do
      expect(subject['lolmdr']).to be_nil
    end
  end
end
