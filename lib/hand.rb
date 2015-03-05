class Hand

  attr_accessor :cards
  attr_accessor :five_cards
  attr_accessor :best_five
  attr_accessor :made_hands

  def initialize(args)
    if args.is_a? String
      @cards = string_to_cards(args)
    elsif args.is_a? Array
      @cards = cards
    end
    @cards.sort! { |a, b|
      Deck::RANKS.index(a.rank) <=>
      Deck::RANKS.index(b.rank)
    }
    @made_hands = Hash.new([])
    evaluate_hand
  end

  def evaluate_hand
    cards.combination(5) do |hand|
      @five_cards = hand
      if _straight_flush?
        @made_hands[:straight_flushes] << hand
        # "Straight Flush"
      elsif _quads?
        made_hands[:quads] << hand
        # "Four of a kind"
      elsif _full_house?
        @made_hands[:full_houses] << hand
        # "Full house"
      elsif _flush?
        @made_hands[:flushes] << hand
        # "Flush"
      elsif _straight?
        @made_hands[:straights] << hand
        # "Straight"
      elsif _three_of_a_kind?
        @made_hands[:sets] << hand
        # "Three of a kind"
      elsif _two_pair?
        @made_hands[:two_pairs] << hand
        # "Two pair"
      elsif _one_pair?
        @made_hands[:pairs] << hand
        # "One pair"
      else
        # made_hands[:high_cards] << hand
        # "High card"
      end
    end

    binding.pry
  end

  def straight?
    @made_hands[:straights].length > 0
  end

  def flush?
    @made_hands[:flushes].length > 0
  end

  def quads?
    @made_hands[:quads].length > 0
  end


  class HandFormatError < StandardError; end
  private


  def _straight_flush?
    _straight? && _flush?
  end

  def _flush?
    suits.length == 1
  end

  def _straight?
    !all_straights.detect { |straight| straight.sort == five_cards }.nil?
  end

  def _quads?
    ranks.uniq.detect do |rank|
      ranks.count(rank) == 4
    end ? true : false
  end

  def _full_house?
    false
  end

  def _three_of_a_kind?
    false
  end

  def _two_pair?
    false
  end

  def _one_pair?
    false
  end



  def string_to_cards(string)
    raise HandFormatError if string.length.odd?
    cards = []
    chars = string.chars
    while (card = chars.pop(2)).length == 2
      cards << Card.new(card.join)
    end

    cards
  end

  def suits
    five_cards.map {|card| card.suit}.uniq
  end

  def ranks
    five_cards.map {|card| card.rank }.sort
  end

  def all_ranks
    @all_ranks ||= (Deck::RANKS + [Deck::RANKS.first])
  end

  def all_straights
    @all_straights ||= all_ranks.
      map.with_index { |rank, index| all_ranks.slice(index, 5) }.
      select { |v| v.length == 5 }
  end

end
