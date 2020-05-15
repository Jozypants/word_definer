require 'pry'

class Word
  attr_reader :name
  @@words = {}

  def initialize(name)
    @name = name
  end

  def self.all
    @@words.values()
  end

  def self.clear()
    @@words = {}
  end

  def save
    @@words = Word.new(self.name)
  end
end