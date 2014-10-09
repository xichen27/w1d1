

class Code
  
  attr_accessor :guess_combo, :target_combo

    @@options = [ "R", "G", "B", "Y", "O", "P"]  
  
  def initialize
    @guess_combo = Array.new(4, nil)
    @target_combo = Array.new(4, nil)
    self.make_target
  end
  
  def make_target
    @@options.shuffle!
    @target_combo = @@options[0..3]
  end
  
  def win?
    target_combo == guess_combo
  end
  
  def error_messages
    puts "You can only select each once." unless self.unique
    puts "You have to have the right length" unless self.length
    puts "You have use the right colors." unless self.right_color
  end

  def unique
    guess_combo.uniq == guess_combo
  end

  def length
    guess_combo.length == target_combo.length
  end

  def right_color
    guess_combo.all? {|el| @@options.include?(el) }
  end

  def exact_matches
    
    white_counter = 0
    target_combo.each_with_index do |el, index|
      white_counter +=1 if guess_combo[index] == el
    end
    white_counter
  end

  def near_matches
     black_counter =0
     target_combo.each do |el|
       black_counter +=1 if guess_combo.include?(el)
     end
     black_counter - exact_matches
  end
  
  def valid?
    p guess_combo
    self.unique && self.length && self.right_color
  end
  
end

class Game
  def initialize
    @code = Code.new
    @code.target_combo
  end
  
  def take_turn
    
    i = 0
    until i == 9 || @code.win?
      puts "Make a guess!" 
      @code.guess_combo = parse(gets.chomp)

      unless @code.valid?
         puts @code.error_messages
         next
       else
         puts @code.exact_matches
         puts @code.near_matches
         i += 1
       end
    end
    puts "GAME OVERRYGP"
  end
  
  def parse(input)
    input = input.split('')
  end

end




