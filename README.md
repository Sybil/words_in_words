##Six letters challenge 

### Installation

You need ruby

```
bundle install
ruby lib/six_letters_challenge.rb
```

### Tests

```
rspec
```

### Basics

The script tries to split in two words all 6-characters words given in a dictionary.

### Logic

First we load in memory the dictionary to avoid time loss when opening/closing multiple time the file. 
Could be more potent on a server because we'll keep the dictionary in memory and it would be a one time action.

Then we just try to split the word in two and look for similar words of this size.

We use a bsearch because the dictionary is ordered, could be easier to read with include? method.

### Bonus

For fun there is a class (GeneralizedSplitWords) which can split words in any number of smaller words. The code is uglier since we used recursivity.

