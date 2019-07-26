require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("Ghost", nil)
    @word.save()
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition = Definition.new("pizza", @word.id, nil)
      definition2 = Definition.new("pizza", @word.id, nil)
      expect(definition).to(eq(definition2))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      definition = Definition.new("Kickflip", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Yes", @word.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      definition = Definition.new("Awesome", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Cool", @word.id, nil)
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      definition = Definition.new("Wow", @word.id, nil)
      definition.save()
      expect(Definition.all).to(eq([definition]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      definition = Definition.new("Fun", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Turkey", @word.id, nil)
      definition2.save()
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

  describe('#update') do
    it("updates an definition by id") do
      definition = Definition.new("Chicken", @word.id, nil)
      definition.save()
      definition.update("Roast Beef", @word.id)
      expect(definition.name).to(eq("Roast Beef"))
    end
  end

  describe('#delete') do
    it("deletes a definition by id") do
      definition = Definition.new("Pizza", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Pizza", @word.id, nil)
      definition2.save()
      definition.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end

  describe('.find_by_word') do
    it("finds definitions for a word") do
      word2 = Word.new("Pizza", nil)
      word2.save()
      definition = Definition.new("Cat", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Pepsi", word2.id , nil)
      definition2.save()
      expect(Definition.find_by_word(word2.id)).to(eq([definition2]))
    end
  end
end
