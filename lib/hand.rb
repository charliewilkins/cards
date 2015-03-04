class Hand

  attr_accessor :cards

  def initialize(cards)
    @hand_cards = cards
  end

  def name

  end

  def best_hand
    hand_cards.combination(5) do |hand|
      @cards = hand
      if royal_flush?
        "Royal Flush"
      elsif straight_flush?
        "Straight Flush"
      elsif quads?
        "Four of a kind"
      elsif full_house?
        "Full house"
      elsif flush?
        "Flush"
      elsif straight?
        "Straight"
      elsif three_of_a_kind?
        "Three of a kind"
      elsif two_pair?
        "Two pair"
      elsif one_pair?
        "One pair"
      else
        "High card"
      end
    end
  end

  def flush?
    suits.length == 1
  end

  def straight?
    !all_straights.detect { |straight| straight.sort == ranks }.nil?
  end

  private

  def suits
    cards.map {|card| card.suit}.uniq
  end

  def ranks
    cards.map {|card| card.rank }.sort
  end

  def all_ranks
    (Deck::RANKS + [Deck::RANKS.first])
  end

  def all_straights
    all_ranks.
      map.with_index { |rank, index| all_ranks.slice(index, 5) }.
      select { |v| v.length == 5 }
  end

end
