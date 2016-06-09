class Hangman

  require 'yaml'

  attr_accessor :file_name, :turn_counter, :guessed_letters_and_words

  def initialize(file_name)
    @file_name = file_name
    @secret_word = random_word_giver
    @secret_word_letters = @secret_word.split("")
    @answer_array = []
    @secret_word_letters.size.times { @answer_array << "_" }
    display_empty_board(@secret_word_letters)
    @turn_counter = 15
    @guessed_letters_and_words = ""
    @end_game = false
    play_game
  end


  def play_game(loaded = false)
    display_altered_board if loaded
    puts ("Guessed letters and words: " + @guessed_letters_and_words) if loaded
    puts "You have #{@turn_counter} turns lefts" if loaded
    while @turn_counter > 0
    question_user_reveal_changes
    puts "YOU LOSE, the word was #{@secret_word}" if @turn_counter == 0
    puts ("Guessed letters and words: " + @guessed_letters_and_words)
    puts "You have #{@turn_counter} turns lefts"
    break if @end_game
    end
  end


  def random_word_giver
    myFile = File.open("dict.txt", "r")
    dict_string = myFile.read
    myFile.close
    dict_array = dict_string.split("\n")

    rand_word = ""
    loop do
      rand_word = dict_array.sample
      break if rand_word.length >= 5 && rand_word.length <= 12
    end
    rand_word
  end

  def display_empty_board(secret_word_letters)
    size_of_secret_word = secret_word_letters.size
    puts "\n\n\n"
    blank_array = []
    size_of_secret_word.times { blank_array << "_"}
    puts blank_array.join(" ").rjust(30," ")
    puts "\n\n\n"
  end

  def victory?
    puts "YOU WIN!!!!" if @answer_array == @secret_word_letters
    return true if @answer_array == @secret_word_letters
  end

  def display_altered_board
    puts "\n\n\n"
    puts @answer_array.join(" ").rjust(30," ")
    puts "\n\n\n"
  end


  def get_user_input
    puts "Would you like to guess a letter or a word?
    1 Letter
    2 Word
    3 SAVE"
    choice = ""
    loop do
      response = gets.chomp.downcase

      if response == "1" || response == "letter"
        puts "Which letter would you like to choose?"
        choice = gets.chomp.downcase
        break
      elsif response == "2" || response == "word"
        puts "Which word would you like to guess?"
        choice = gets.chomp.downcase
        break
      elsif response == "3" || response == "save"
        choice = "save"
        puts "YOU HAVE SAVED THE GAME"
        save
        break
      else
        puts "Would you like to guess a letter or a word?
         1 Letter
         2 Word"
        puts "Please make a correct selection"
      end
    end
      choice
  end

  def save
    File.open("save_file.yaml", "a") do |f|
      f.puts YAML::dump(self)
    end
  end

  def question_user_reveal_changes

    user_input = get_user_input.strip
 


        @guessed_letters_and_words << user_input + " " unless user_input == "save"
        user_word_letters = user_input.split("") if user_input.length > 1
        turn_minus = true

          for n in 0...@secret_word_letters.size
            if user_input == @secret_word_letters[n]
              @answer_array[n] = @secret_word_letters[n]
              turn_minus = false
            end
          end

          if user_word_letters == @secret_word_letters
            @answer_array = @secret_word_letters
            turn_minus = false
          end

          if user_input == "save"
            @end_game = true
            turn_minus = false
          end

          @turn_counter -= 1 if turn_minus
          display_altered_board
  end
end

require 'yaml'
yaml_string = ""

puts "Hello, would you like to
1 start a new game
2 load a save file"
response = gets.chomp

if response == "1"
  puts "enter the name of your new game save file"
  file_name = gets.chomp
  file_name = Hangman.new(file_name)
elsif response == "2"
  File.open("save_file.yaml", "r") do |f|
    yaml_string = f.read
  end
  yaml_data = YAML::load_stream(yaml_string)
  puts "PLEASE SELECT A FILE TO LOAD, CHOOSE BY THE NUMBER \n "
  yaml_data.each_with_index { |x,index| puts "#{index}: filename:#{x.file_name} | turns left:#{x.turn_counter} | guessed already:#{x.guessed_letters_and_words}\n---" }
  puts "PLEASE SELECT A FILE TO LOAD, CHOOSE BY THE NUMBER \n "
  num_response = gets.chomp.strip.to_i
  yaml_data[num_response].play_game(true)
else
  puts "please enter a valid choice, 1 to start a new game, 2 to load a save file"
end