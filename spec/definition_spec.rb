require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definitions' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("Procrastinate", nil)
    @word.save()
  end

  describe('#==') do
    it("is the same song if it has the same attributes as another song") do
      definition1 = Definition.new("to put something off", @word.id, nil)
      definition2 = Definition.new("to put something off", @word.id, nil)
      expect(definition1).to(eq(definition2))
    end
  end

  describe('.all') do
    it("returns a list of all defs") do
      definition1 = Definition.new("delay or postpone action", @word.id, nil)
      definition1.save()
      definition2 = Definition.new("to put something off", @word.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition1, definition2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      definition1 = Definition.new("delay or postpone action", @word.id, nil)
      definition1.save()
      definition2 = Definition.new("to put something off", @word.id, nil)
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      definition1 = Definition.new("delay or postpone action", @word.id, nil)
      definition1.save()
      expect(Definition.all).to(eq([definition1]))
    end
  end

  describe('.find') do
    it("finds a def by id") do
      definition1 = Definition.new("delay or postpone action", @word.id, nil)
      definition1.save()
      definition2 = Definition.new("to put something off", @word.id, nil)
      definition2.save()
      expect(Definition.find(definition1.id)).to(eq(definition1))
    end
  end

  describe('#update') do
    it("updates an def by id") do
      definition1 = Definition.new("delay or postpone action", @word.id, nil)
      definition1.save()
      definition1.update("Be lazy.", @word.id)
      expect(definition1.meaning).to(eq("Be lazy."))
    end
  end

  describe('#delete') do
    it("deletes an def by id") do
      definition1 = Definition.new("delay or postpone action", @word.id, nil)
      definition1.save()
      definition2 = Definition.new("to put something off", @word.id, nil)
      definition2.save()
      definition1.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end
  
  describe('.find_by_word') do
    it("finds defs for an word") do
      word2 = Word.new("Perpetuate", nil)
      word2.save
      definition1 = Definition.new("delay or postpone action", @word.id, nil)
      definition1.save()
      definition2 = Definition.new("to put something off", word2.id, nil)
      definition2.save()
      expect(Definition.find_by_word(word2.id)).to(eq([definition2]))
    end
  end
end