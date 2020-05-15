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

  # describe('#save') do
  #   it("saves a song") do
  #     song = Song.new("Naima", @album.id, nil)
  #     song.save()
  #     expect(Song.all).to(eq([song]))
  #   end
  # end

  # describe('.find') do
  #   it("finds a song by id") do
  #     song = Song.new("Giant Steps", @album.id, nil)
  #     song.save()
  #     song2 = Song.new("Naima", @album.id, nil)
  #     song2.save()
  #     expect(Song.find(song.id)).to(eq(song))
  #   end
  # end

  # describe('#update') do
  #   it("updates an song by id") do
  #     song = Song.new("Naima", @album.id, nil)
  #     song.save()
  #     song.update("Mr. P.C.", @album.id)
  #     expect(song.name).to(eq("Mr. P.C."))
  #   end
  # end

  # describe('#delete') do
  #   it("deletes an song by id") do
  #     song = Song.new("Giant Steps", @album.id, nil)
  #     song.save()
  #     song2 = Song.new("Naima", @album.id, nil)
  #     song2.save()
  #     song.delete()
  #     expect(Song.all).to(eq([song2]))
  #   end
  # end
end