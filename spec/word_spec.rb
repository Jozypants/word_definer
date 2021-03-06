require 'rspec'
require 'word'
require 'definition'
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

    describe('#==') do
      it("is the same word if it has the same attributes as another word") do
        word = Word.new("lightning", nil)
        word2 = Word.new("lightning", nil)
        expect(word).to(eq(word2))
      end
    end

    describe('.find') do
      it("finds a word by id") do
        word = Word.new("tenacious", nil)
        word.save()
        word2 = Word.new("thorough", nil)
        word2.save() 
        expect(Word.find(word.id)).to(eq(word))
      end
    end
    
    describe('#definitions') do
      it("returns a word's definitions") do
        word = Word.new("Procrastinate", nil)
        word.save()
        definition1 = Definition.new("delay or postpone action", word.id, nil)
        definition2 = Definition.new("to put something off", word.id, nil)
        definition2.save()
        expect(word.definitions).to(eq([definition1, definition2]))
      end
    end

    describe('#update') do
      it("updates a word by id") do
        word1 = Word.new("propose", nil)
        word1.save()
        word1.update("purpose")
        expect(word1.name).to(eq("purpose"))
      end
    end

    describe('#delete') do
      it("deletes an word by id") do
        word1 = Word.new("purpose", nil)
        word1.save()
        word2 = Word.new("to put something off", nil)
        word2.save()
        word1.delete()
        expect(Word.all).to(eq([word2]))
      end
    end

    describe('.all') do
      it("is returns an empty array when there are no words") do
        expect(Word.all).to(eq([]))
      end
    end

    describe('.clear')do
    it("clears all words") do
      word1 = Word.new("purpose", nil)
      word1.save()
      word2 = Word.new("to put something off", nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

end
