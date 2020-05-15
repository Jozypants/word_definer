require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Word' do

  before(:each) do
    Word.clear()
  end


  describe('#save') do
    it("saves a word") do
      word = Word.new("tenacious", nil)
      word.save()
      word2 = Word.new("thorough", nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('#definitions') do
    it("returns a word's definitions") do
      word = Word.new("Procrastinate", nil)
      word.save()
      definition1 = Definition.new("delay or postpone action", @word.id, nil)
      definition1.save()
      definition2 = Definition.new("to put something off", @word.id, nil)
      definition2.save()
      expect(word.definitions).to(eq([definition1, definition2]))
    end
  end
end
