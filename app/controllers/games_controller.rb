require "json"
require "open-uri"

class GamesController < ApplicationController

  def new
    @letters = ("a".."z").to_a.sample(10)
  end

  def score
    @word = params[:word]
    @game_letters = params[:letters]

    base_url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    dictionary = URI.open(base_url).read
    dictionary_words = JSON.parse(dictionary)
    @answer = dictionary_words["found"] ? "It's a word!" : "It's not a word!"

  end


end
