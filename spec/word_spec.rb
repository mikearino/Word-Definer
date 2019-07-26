require 'rspec'
require 'word'

describe '#Word' do
  describe ('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves words') do
      word = Word.new('Pizza', nil)
      word.save()
      word2 = Word.new('Hamburger', nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end
end
