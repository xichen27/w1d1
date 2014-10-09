class Hangman
  def initialize(player1, player2) # guesser, checker
    @players = Hash[:checker, player1, :guesser, player2]
  end
  
  def start    
    i = 0
    until i == 10 || false#@players[:checker].win?
      letter = @players[:guesser].guess
      p letter
      
      if !@players[:checker].check_guess(letter)
        puts "Invalid guess. Try again"
        next
      else
        p 5
        @player[:checker].make_guess(letter)
        i += 1
      end
    end
   #  return "You win!" if win?
   # "You lose!"
   #
  end
end



class HumanPlayer

  def initialize
    @display = []
  end
  
  def init_display
    @display = Array.new(self.pick_secret_word, "_")
  end 
  
  available_word = ("a".."z").to_a

  def guess
    puts "Guess a letter :D"
    guess = gets.chomp
  end

  def pick_secret_word
    puts "Tell us the length of the word"
    length = gets.chomp.to_i
  end
  
  def check_guess(letter)
    response = gets.chomp
    if response == false
      puts "Keep trying."
    else
      puts "Good job."
      puts @display
    end
  end
  
  def win?
   !@display.include?("_")
  end
  
end

class ComputerPlayer
    
  def initialize
    @secret_word = ""
    self.pick_secret_word
    @display = Array.new
    @available_letters = ("a".."z").to_a
  end
  
  
  def guess
    ('a'..'z').to_a.sample
  end

  def pick_secret_word
    words = File.readlines("dictionary.txt").map {|w| w.chomp}
    @secret_word = words.sample.split('')   
  end
  
  def check_guess(letter)
    @available_letters.include?(letter)
  end
  
  def make_guess(letter)
   
    if @secret_word.include?(letter)
      indices = @secret_word.each_index.select{|i| @secret_word[i] == letter}
            #
      indices.map {|i| @display[i] = letter}
      puts "Good job. Keep going."
      p @display
    else
      puts "Try again!!"
    end
    @available_letters.delete(letter)
  end
  
  def check(letter)
    if @secret_word.include?(letter)
      indices = @secret_word.each_index.select{|i| @secret_word[i] == letter}
            #
      indices.map {|i| @display[i] = letter}
      puts "Good job. Keep going."
      p @display
    else
      puts "Try again!!"
    end
    @available_letters.delete(letter)
  end
 
  def win?
    @secret_word == @display
  end
 
end

class Player
  
end