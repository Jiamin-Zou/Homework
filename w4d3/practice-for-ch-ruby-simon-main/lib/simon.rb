class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    puts "Get ready ...... "
    [3, 2, 1].each do |count|
      print "#{count}... "
      sleep(1)
    end
    puts
    puts "Round 1, START! "
    sleep(1)
    system("clear")
    sleep(0.5)
    until game_over
      self.take_turn
      system("clear")
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    unless game_over
      @sequence_length += 1
      self.round_success_message
      sleep(1)
    end
  end

  def show_sequence
    self.add_random_color
    @seq.each do |color|
      puts color
      sleep(1)
      system("clear")
      sleep(0.5)
    end
  end

  def require_sequence
    puts "Repeat the color sequence shown in order one line at a time: "
    seq.each do |color|
      if gets.chomp.downcase != color
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    seq << COLORS.sample

  end

  def round_success_message
    puts "You're correct ! Round success, on to round #{sequence_length} !"
  end

  def game_over_message
    puts "Oh no. That't not correct. GAME OVER!"
    puts "You completed #{sequence_length - 1} rounds."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

# game = Simon.new
# game.play