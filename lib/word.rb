class Word
  attr_reader :name, :id
  @@words = {}
  @@total_rows = 0

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows +=1
  end

  def self.all
    @@words.values()
  end

  def self.clear()
    @@words = {}
    @@total_rows = 0
  end

   def save
    @@words[self.id] = Word.new(self.name, self.id)
  end

  def ==(word_to_compare)
    self.name() == word_to_compare.name()
  end

  def definitions
    Definition.find_by_word(self.id)
  end

  def self.find(id)
    @@words[id]
  end

  def update(name, id)
    self.meaning = meaning
    self.word_id = word_id
    @@definitions[self.id] = Definition.new(self.meaning, self.word_id, self.id)
  end

  def delete
    @@words.delete(self.id)
  end

end