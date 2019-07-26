require 'rspec'
require 'word'
require 'definition'

describe '#Word' do
  before(:each) do
    Word.clear()
  end

  describe ('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves words") do
      word = Word.new("Pizza", nil)
      word.save()
      word2 = Word.new("Hamburger", nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another word") do
      word = Word.new("Hot", nil)
      word2 = Word.new("Hot", nil)
      expect(word).to(eq(word2))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new("Chili", nil)
      word.save()
      word2 = Word.new("Cat", nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds a word by id") do
      word = Word.new("Car", nil)
      word.save()
      word2 = Word.new("Hat", nil)
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe('#update') do
    it("updates an word by id") do
      word = Word.new("Cool", nil)
      word.save()
      word.update("Awesome")
      expect(word.name).to(eq("Awesome"))
    end
  end

  describe('#delete') do
    it("deletes a word by id") do
      word = Word.new("Spider", nil)
      word.save()
      word2 = Word.new("Hat", nil)
      word2.save()
      word.delete()
      expect(Word.all).to(eq([word2]))
    end
  end

  # describe('#definitions') do
  #   it("returns a words' definitions") do
  #     word = Word.new("Pizza Party", nil)
  #     word.save()
  #     definition = Definition.new("Party", word.id, nil)
  #     definition.save()
  #     definition2 = Definition.new("Turtles Yeah", word.id, nil)
  #     definition2.save()
  #     expect(word.definitions).to(eq([definition, definition2]))
  #   end
  # end

end
