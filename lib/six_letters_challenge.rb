#!/usr/bin/env ruby

require_relative 'load_dictionary'
require_relative 'split_words'
require_relative 'generalized_split_words'

def pretty_print(results)
  results.each do |word, parts|
    print "#{word} : "
    parts.each do |tuplet|
      print "#{tuplet.flatten.join(" - ")}  "
    end
    print "\n"
  end
end

dictionary = LoadDictionary.new.perform
results = SplitWords.new(dictionary, 6).perform
#results = GeneralizedSplitWords.new(dictionary, 8).perform
pretty_print(results)
