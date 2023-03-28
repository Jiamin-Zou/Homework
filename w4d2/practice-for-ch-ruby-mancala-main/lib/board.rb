class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0...@cups.length).each do |i|
      next if i == 6 || i == 13
      4.times do
        @cups[i] << :stone
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(0,13)
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    idx = start_pos

    while !stones.empty?
      idx = (idx + 1) % 14
      case idx
        when 6
          @cups[idx] << stones.pop if current_player_name == @name1
        when 13
          @cups[idx] << stones.pop if current_player_name == @name2
        else
          @cups[idx] << stones.pop
      end
    end
    render
    next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if [6, 13].include?(ending_cup_idx)
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..6].all?(&:empty?) || @cups[7..12].all?(&:empty?)
  end

  def winner
    p1_count = @cups[6].length
    p2_count = @cups[13].length
    if p1_count == p2_count
      :draw
    else
      p1_count > p2_count ? @name1 : @name2
    end
  end
end