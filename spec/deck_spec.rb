require 'spec_helper'
describe Deck do
  context '#draw' do
    it "returns the top card on the deck" do
      pending
      deck = Deck.new
      expect(deck.draw).to eq [Card.new('K', Deck::SUITS[:diamonds])]
    end

    it "drawing a card reduces the number of remaining cards in the deck" do
      pending
      deck = Deck.new
      expect(deck.count).to eq 52
      deck.draw
      expect(deck.count).to eq 51
    end
  end

  context "#shuffle!" do
    it "can shuffle the deck" do
      pending
      deck = Deck.new
      expect { deck.shuffle! }.to_not raise_error
    end
  end
end
