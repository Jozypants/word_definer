require 'pry'

class Word
  attr_reader :name
  @@words = {}

  def initialize(name)
    @name = name
  end