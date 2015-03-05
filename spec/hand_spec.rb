require 'spec_helper'
describe Hand do

  context "#new" do
    it "can be created with string shorthand like 'Ah2h3h4h5h'" do
      hand = Hand.new('Ah2h3h4h5h')
      expect(hand.cards.first).to eq Card.new(1, :hearts)
    end
  end

  context "#evaluate_hand" do
    it "detects straights" do
      hand = Hand.new('Ah2h3h4h5h6d6s')
      expect(hand.straight?).to eq true
    end
    it "detects quads" do
      hand = Hand.new('AdAsAcAh5h6d6s')
      expect(hand.quads?).to eq true
    end
    it "detects not quads" do
      hand = Hand.new('7dAsAcAh5h6d6s')
      expect(hand.quads?).to eq false
    end

    it "detects the best hand" do
      hand = Hand.new('AdAsAcAh5h5d5s')
      expect(hand.made_hands[:quads].length).to eq 3
      expect(hand.best_five).to eq 12
    end
  end

  context "#name" do
    it "quad aces" do
      pending
      hand = Hand.new([
        Card.new(1, :hearts),
        Card.new(1, :diamonds),
        Card.new(1, :spades),
        Card.new(1, :clubs),
        Card.new(13, :hearts),
      ])
      expect(hand.name).to eq "Four of a kind, Aces"
    end
    it "straight" do
      pending
      hand = Hand.new([
        Card.new(10, :hearts),
        Card.new(13, :clubs),
        Card.new(11, :spades),
        Card.new(12, :hearts),
        Card.new(9, :diamonds),
        Card.new(2, :spades),
        Card.new(3, :spades),
      ])
      expect(hand.straight?).to eq true
      # expect(hand.name).to eq "King high straight"
    end
    it "no straight" do
      pending
      hand = Hand.new([
        Card.new(10, :hearts),
        Card.new(13, :clubs),
        Card.new(4, :spades),
        Card.new(12, :hearts),
        Card.new(9, :diamonds),
        Card.new(2, :spades),
        Card.new(3, :spades),
      ])
      expect(hand.straight?).to eq false
      # expect(hand.name).to eq "King high straight"
    end

    it "flush" do
      pending
      hand = Hand.new([
        Card.new(10, :hearts),
        Card.new(2, :hearts),
        Card.new(4, :hearts),
        Card.new(6, :hearts),
        Card.new(8, :hearts),
        Card.new(10, :diamonds),
        Card.new(10, :spades),
      ])
      expect(hand.flush?).to eq true
      # expect(hand.name).to eq "King high straight"
    end
    it "no flush" do
      pending
      hand = Hand.new([
        Card.new(10, :hearts),
        Card.new(13, :clubs),
        Card.new(4, :spades),
        Card.new(12, :hearts),
        Card.new(9, :diamonds),
        Card.new(2, :spades),
        Card.new(3, :spades),
      ])
      expect(hand.flush?).to eq false
      # expect(hand.name).to eq "King high straight"
    end
  end

  context "#>" do
    it "compares hands" do
      pending
      winning_hand = Hand.new([
        Card.new(1, :hearts),
        Card.new(1, :diamonds),
        Card.new(1, :spades),
        Card.new(1, :clubs),
        Card.new(13, :hearts),
      ])
      losing_hand = Hand.new([
        Card.new(13, :hearts),
        Card.new(13, :diamonds),
        Card.new(13, :spades),
        Card.new(13, :clubs),
        Card.new(12, :hearts),
      ])
      expect(winning_hand > losing_hand).to eq true
      # expect(ah.inspect).to eq 'A♥'
    end
  end
end

