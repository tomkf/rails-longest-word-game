require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    # will be used to display a new random grid and a form.
    # @letters instance variable storing these random letters from the alphabet.
    # Then display it in the view. You should get something like this:
    char_array = ('a'..'z').to_a
    @my_chars = []
    10.times do
    rand_num = rand(1...26)
      @my_chars.push(char_array[rand_num])
    end
    return @my_chars
  end

def compare_instances(attempt, grid)
  final_answer = []
  attempt_array = attempt.split("")
  grid.each do |item|
    final_answer.push(item) if attempt_array.include?(item)
  end
  indexer = (final_answer & attempt_array).flat_map { |i| [i] * [final_answer.count(i), attempt_array.count(i)].min }
  if indexer.sort == attempt_array.sort
    return true
  else return false
  end
end

def word_exists(word)
  url = "https://wagon-dictionary.herokuapp.com/#{word}"
  string = open(url).read
  api_result = JSON.parse(string)
  api_result['found']
end

  def score
    #form will be submitted (with POST) to the score action.
@user_answer = params["input"]
grid_check = params["user_array"].split("").join.split(" ")
compare_check = compare_instances(@user_answer, grid_check)
exist_check = word_exists(@user_answer)
@responce = ""

if exist_check == false
@responce = "Sorry, but #{@user_answer} is not an English word"
  elsif compare_check == false
@responce = "Sorry but #{@user_answer} can't be built out of #{display(grid_check)} "
  else
    @responce = "Congrats buddy, that was a real word my dude...."
end
return @responce
end


def display(arr)
string_print = ""

arr.each do |item|
  string_print += item
  string_print += ", "
end

return string_print
end

end
