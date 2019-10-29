require 'set'

class WordChainer
  def initialize(filename)
    @dictionary = File.readlines(filename).map(&:chomp).to_set
    @path = []
  end

  def run(source, target)
    @current_words = [source]
    @all_seen_words = { source => nil }

    until @current_words.empty?
      explore_current_words
    end

    build_path(target)
    @path.unshift(target)
   p @path.reverse
  end

  def explore_current_words
    new_current_words = []
    @current_words.each do |current_word|
      adjacent_words(current_word).each do |adj_word|
        if !(@all_seen_words.include?(adj_word))
          new_current_words << adj_word
          @all_seen_words[adj_word] = current_word
        end
      end
    end
    @current_words = new_current_words
  end

  def adjacent_words(word)
    words = []
    word.each_char.with_index do |letter, i|
      ("a".."z").to_a.each do |new_letter|
        next if new_letter == letter

        adj_word = word.dup
        adj_word[i] = new_letter
        words << adj_word if @dictionary.include?(adj_word)
      end
    end
    words
  end

  def build_path(target)
    return target if @all_seen_words[target] == nil

    word_before = @all_seen_words[target]
    @path << word_before
    build_path(word_before)
  end

end

chainer = WordChainer.new("./dictionary.txt")
chainer.run('cat','mop')