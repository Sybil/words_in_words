require "split_words"

describe SplitWords do
  describe "#perform" do
    subject { SplitWords.new(dictionary, words_size).perform }

    let(:dictionary) do 
      {
        3 => ['ook', 'lol', 'mdr'],
        6 => ['lolmdr'],
        9 => ['lollolmdr']
      }
    end
    let(:words_size) { 6 }

    it "splits words of the given size" do
      expect(subject['lolmdr']).to eq([['lol', 'mdr']])
    end

    it "doesn't split words of different size" do
      expect(subject['lollolmdr']).to be_nil
    end
  end
end
