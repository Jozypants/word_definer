require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Word' do

  before(:each) do
    Word.clear()
    @word = Word.new("tenacious")
    @word.save()
    @word2 = Word.new("thorough")
    @word.save()
  end

  describe('#save') do
    it("saves a word") do
      expec(Word.all).to(eq([@word, @word2]))
    end
  end

  #  describe('') do
  #   it() do
  #     expec().to(eq())
  #   end
  # end
end


# EXAMPLES FOR TESTING 
# describe '#Class' do
#   before(:each) do
#     Class.clear()
#     @class_variable = Class.new()
#     @class_variable.save()
#   end

#   describe('method') do
#     it("describe test here") do
#       expect(method).to(eq(something))
#     end
#   end
# end