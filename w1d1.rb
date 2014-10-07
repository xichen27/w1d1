class Array
  
  def my_uniq
    result = []
    (0..self.length - 1).each do |index|
      next if result.include?(self[index])
      result << self[index]
    end
    result
  end
  
  def two_sum
    result = []
    (0..self.length - 2).each do |index1|
      (index1 + 1..self.length - 1).each do |index2|
        if self[index1] + self[index2] == 0
          result << [index1, index2]
        end
      end
    end
    result
  end
  
  def my_transpose
    result = []
    self.each_index do |row|
      new_row = []
      self[row].each_index do |col|
        new_row << self[col][row]
      end
      result << new_row
    end
    result
  end 
  
  def my_each(&block)
    self.map do |n| 
      block.call(n)
    end
  end
     
end


def towers_of_hanoi
  tower1 = []
  tower2 = []
  tower3 = [1, 2, 3, 4, 5]
  towers = [tower1, tower2, tower3]
  tower_indices = [0, 1, 2]

  while tower1 != [1,2,3,4,5] do
    puts "Select the tower you want remove the disc from."
    from_tower = gets.chomp.to_i - 1

    puts "Select the tower you want to place the disc upon."
    to_tower = gets.chomp.to_i - 1

    if !tower_indices.include?(from_tower) || !tower_indices.include?(to_tower)
      puts "Can't select an imaginary tower"
      next
    end

    if towers[from_tower].empty?
      puts "Can't select from an empty tower"
      next
    end

    unless towers[to_tower].empty?
      puts "To tower is not empty"
      if towers[to_tower].first < towers[from_tower].first
        puts "The moved disc is TOO BIG for that tower!"
        next
      end
    end

      disc = towers[from_tower].shift
      towers[to_tower].unshift(disc)
      p towers
  end
  puts "Yay you win!"
end

def num_to_s(num, base)
  hex = Hash[
    0, "0",
    1, "1",
    2, "2",
    3, "3",
    4, "4",
    5, "5",
    6, "6",
    7, "7",
    8, "8",
    9, "9",
    10, "A",
    11, "B",
    12, "C",
    13, "D",
    14, "E",
    15, "F"
  ]
  
  power = 0
  result = ""
  until num/(base ** power) == 0
   result = hex[(num/(base ** power)) % base] + result
   power += 1
  end 
  result
end

def caesar(str,num)
  result = ''
  str.each_char do |char|
    result = result + ((char.ord - "a".ord + num) % 26 + "a".ord).chr
  end
  result
end

# ClassName#method_name => instance method
# ClassName::method_name => class method

class MyHashSet
  attr_accessor :store
  
  def initialize
    @store = {}
  end
  
  def insert(el)
    @store[el] = true
  end
  
  def include?(el)
    @store.has_key?(el)
  end
  
  def delete(el)
    @store.delete(el)
  end
  
  def to_a
    array = []
    @store.each do |key, value|
      array << [key,value]
    end
    array
  end
  
  def union(set2)
    @store.merge(set2.store)
  end
  
  def intersect(set2)
    result = {}
    @store.keys.each do |key|
      result[key] = true if set2.store.keys.include?(key)
    end
    result
  end
  
  def minus(set2)
    result = {}
    @store.keys.each do |key|
      result[key] = true unless set2.store.keys.include?(key)
    end
    result
  end
  
end

#Enumerable
def double(array)
  new_array = array.map {|n| n*2}
  p new_array
end

def median(array)
  sorted = array.sort
  return sorted[(sorted.length - 1)/2] if sorted.length.odd?
  (sorted[sorted.length/2] + sorted[(sorted.length/2)-1])/2
end

def concatenate(str_array)
  str_array.inject('') {|concat, str| concat + str}
end


class Fixnum
  def in_words

    ones = Hash[
      1, "one",
      2, "two",
      3, "three",
      4, "four",
      5, "five",
      6, "six",
      7, "seven",
      8, "eight",
      9, "nine",
    ]
    
    teens = Hash[
      10, "ten",
      11, "eleven",
      12, "twelve",
      13, "thirteen",
      14, "fourteen",
      15, "fifteen",
      16, "sixteen",
      17, "seventeen",
      18, "eighteen",
      19, "nineteen"
    ]
    
    tens = Hash[
      20, "twenty",
      30, "thirty",
      40, "forty",
      50, "fifty",
      60, "sixty",
      70, "seventy",
      80, "eighty",
      90, "ninety"
    ]
    
    magnitudes = Hash[
      1000000000000, "trillion", 
      1000000000, "billion", 
      1000000, "million", 
      1000, "thousand",
      1, ""
    ]
    
    
    num = self
    num_array = []
    magnitudes.keys.each do |mag|
      num_array << num / mag
      num = num % mag
    end
    
    str_array = []
    num_array.each do |el|
      if el == 0
        str_array << "zero"
      else
        str = ''
        
        hund = el / 100
        ten = (el % 100) / 10
        teen = el % 100
        one = el % 10
        
        str = str + ones[hund] + 'hundred' unless hund == 0
        str = str + tens[ten * 10] if ten >= 2
        str = str + teens[teen] if ten == 1
        str = str + ones[one] unless ten == 1 || one == 0
        
        str_array << str
      end
    end
    
    return_str = ''
    str_array.each_with_index do |word, index|
      next if word == "zero"
      return_str = return_str + word + magnitudes.values[index]
    end
    
    return_str
      

          
          
       #     hund = num /100
       #     ten = num % 100
       #     str = str + ones[hund] + "hundred"
       #
       #     if ten < 9 && ten > 0
       #       str = str + ones[ten]
       #     else
       #       if ten < 20 && ten > 9
       #         str = str + teens[ten]
       #       elsif ten >= 20
       #         str = str + tens[ten]
       #       end
       #
       #       one = ten % 10
       #       unless ones == 0
       #         str = str + ones[one]
       #       end  
    
    
  end
end

    # str = ''
#     num = self
#     #while num > 0
#       magnitudes.keys.reverse.each do |mag|
#         triple = num / mag
#         unless triple == 0
#         hund = triple / 100
#         str = str + ones[hund] + hundreds[100] unless hund == 0
#
#
#         str = str + magnitudes[mag]
#       end
#         num = num % mag
#       end
#
#       str
#     end
#   end
#
#   def triple_digits(num)
#
#    
#     end
#     str
#   end
    
  
      
      