class LoadDictionary

  FILE_PATH = "data/wordlist.txt"

  def perform
    load_file(FILE_PATH)

    dictionary
  end

  private

  def load_file(file_path)
    File.open(file_path, "r") do |file|
      file.each_line do |line|
        save_word(line)
      end
    end
  end

  def save_word(line)
    word =  line.to_s.strip.downcase
    dictionary[word.length] = [] if dictionary[word.length].nil?
    dictionary[word.length] << word unless word.empty?
  end

  def dictionary
    @dictionary ||= {}
  end
end
