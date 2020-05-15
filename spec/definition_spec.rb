require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definition' do
  before (:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("procrastinate", nil)
    @word.save
  end
  
  describe('#==') do
    it ("is the same def if it has the same attributes as another def")do
    definition1 = Definition.new("delay or postpone action; put off doing something.", @word.id, nil)
    definition2 = Definition.new("delay or postpone action; put off doing something.", @word.id, nil)
    expect(definition1).to(eq(definition2))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
    definition1 = Definition.new("delay or postpone action; put off doing something.", @word.id, nil)
    definition1.save()
    definition2 = Definition.new("Put somethingoff", @word.id, nil)
    definition2.save()
    expect(Definition.all).to(eq([definition1, definition2]))
    end
  end

end