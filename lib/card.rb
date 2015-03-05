require "cards/version"

class Card
  attr_reader :suit
  attr_reader :rank

  def initialize(*args)
    rank = nil
    suit = nil
    if args.length == 1 && args.first.is_a?(String)
      # '4h' - string format
      rank, suit = *args.first.chars
    elsif args.length == 2
      # rank and suit
      rank, suit = *args
    end

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
      Deck::SUITS.detect { |k, v| k.to_s.chars.first == suit.downcase }.last
    end
  end

  def card_rank(rank)
    binding.pry if rank.nil?
    if Deck::RANKS.include?(rank)
      rank
    else
      Deck::RANKS[rank - 1]
    end
  end
end
