class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    DICTIONARY.sample
  end
  
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(c)
    attempted_chars.include?(c)
  end

  def get_matching_indices(c)
    matched = []
    @secret_word.each_char.with_index do |char, idx|
      if c == char
        matched << idx 
      end
    end
    matched
  end

  def fill_indices(c, arr)
    arr.each do |idx|
      @guess_word[idx] = c
    end
  end

  def try_guess(c)
    if self.already_attempted?(c)
     puts "that has already been attempted "
     return false
    end

    @attempted_chars << c

    indices = self.get_matching_indices(c)
    self.fill_indices(c, indices)
    if indices.empty?
      @remaining_incorrect_guesses -= 1
    end
    true
  end

  def ask_user_for_guess
    puts "Enter a char:"
    char = gets.chomp
    guessed = self.try_guess(char)
    return guessed
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN"
       return true
    else
      return false
    end

  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else 
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    else
      return false
    end
   end
end
