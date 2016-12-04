class SplitWords

  attr_reader :dictionary, :words_size

  def initialize(dictionary, words_size)
    @dictionary = dictionary
    @words_size = words_size || 6
  end
    
  def perform
    split_words
  end

  private

  def good_sized_words
    @good_sized_words ||= dictionary[words_size]
  end

  def split_words
    good_sized_words.each_with_object({}) do |word, spliteable_words|
      result = split_in_two(word)
      spliteable_words[word] = result unless result.empty?
    end
  end

  def split_in_two(word)
    results = []

    (1..words_size-3).each do |i|
      first_word = word[0..i]
      second_word = word[i+1..words_size]

      results << [first_word, second_word] if smaller_words_exist?(first_word, second_word)
    end

    results
  end

  def smaller_words_exist?(first_word, second_word)
    !dictionary[first_word.length].nil? &&
      !dictionary[second_word.length].nil? &&
      !dictionary[first_word.length].bsearch{ |word| first_word <=> word }.nil? &&
      !dictionary[second_word.length].bsearch{ |word| second_word <=> word }.nil?
  end
end
