class GeneralizedSplitWords

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
      result = split(word)
      spliteable_words[word] = result unless result.empty?
    end
  end

  def split(word)
    @results = []
    recursive_split(word, [])

    @results
  end

  def recursive_split(sliced_word, previous_words)
    if !previous_words.empty? && word_exists?(sliced_word)
      @results << previous_words + [sliced_word]
    end

    if sliced_word.length >= 4
      (1..sliced_word.length-3).each do |i|
        first_word = sliced_word[0..i]
        next_words = sliced_word[i+1..sliced_word.length]

        if word_exists?(first_word)
          found_parts = previous_words + [first_word]
          recursive_split(next_words, found_parts)
        end
      end
    end
  end

  def word_exists?(word)
    !dictionary[word.length].nil? &&
      !dictionary[word.length].bsearch{ |dic_word| word <=> dic_word }.nil?
  end
end
