require "cards/version"

class Card
  attr_reader :suit
  attr_reader :rank

  def initialize(rank, suit)
    @rank = card_rank(rank)
    @suit = suit_glyph(suit)
  end

  def to_s
    "#{@rank}#{@suit}"
  end
  alias_method :inspect, :to_s

  def ==(card)
    self.class == card.class &&
      self.rank == card.rank &&
      self.suit == card.suit
  end
  alias_method :eql?, :==

  private
  def suit_glyph(suit)
    if Deck::SUITS.keys.include?(suit)
      Deck::SUITS[suit]
    elsif Deck::SUITS.values.include?(suit)
      suit
    else
      raise 'bad suit'
    end
  end

  def card_rank(rank)
    if Deck::RANKS.include?(rank)
      rank
    else
      Deck::RANKS[rank - 1]
    end
  end
end
