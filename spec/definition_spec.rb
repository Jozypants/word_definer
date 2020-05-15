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
    definition = Definition.new("delay or postpone action; put off doing something.", @word.id, nil)
    definition2 = Definition.new("delay or postpone action; put off doing something.", @word.id, nil)
    expect(definition2).to(eq(definition2))
    end
  end
end