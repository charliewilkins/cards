class Deck
  SUITS = {
    hearts:   '♥',
    spades:   '♠',
    clubs:    '♣',
    diamonds: '♦'
  }
  RANKS = %w(A 2 3 4 5 6 7 8 9 T J Q K)

  def initialize
    @cards = []
    suits.values.each do |suit|
      ranks.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
  end

  def shuffle!
    @cards.shuffle!
  end

  def count
    @cards.count
  end

  def draw(args = 1)
    @cards.pop(args)
  end

  def first
    @cards.first
  end

  def last
    @cards.last
  end

  def suits
    SUITS
  end

  def ranks
    RANKS
  end


end
