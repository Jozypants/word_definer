class Definition
  attr_reader :id
  attr_accessor :meaning, :word_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(meaning, word_id, id)
    @meaning = meaning
    @word_id = word_id
    @id = id || @@total_rows += 1
  end

  def ==(word_to_compare)
    (self.meaning() == word_to_compare.meaning()) && (self.word_id() == word_to_compare.word_id())
  end

  def self.all
    @@definitions.values
  end

  def save
    @@definitions[self.id] = Definition.new(self.meaning, self.word_id, self.id)
  end

  def self.find(id)
    @@definitions[id]
  end

  # def update(meaning, word_id)
  #   self.meaning = meaning
  #   self.album_id = album_id
  #   @@definitions[self.id] = Definition.new(self.meaning, self.album_id, self.id)
  # end

  def delete
    @@definitions.delete(self.id)
  end

  def self.clear
    @@definitions = {}
  end
end