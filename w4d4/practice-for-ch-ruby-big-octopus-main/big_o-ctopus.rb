require "benchmark"

# Big O-ctopus And Biggest Fish

#  Find the longest fish in O(n^2) time.
def sluggish_octopus(fishes)
    longest_fish = ""
    fishes.each_with_index do |fish_1, i|
        fishes.each_with_index do |fish_2, j|
            next if i == j
            bigger_fish = fish_1.length > fish_2.length ? fish_1 : fish_2
            longest_fish = bigger_fish if bigger_fish.length > longest_fish.length
        end
    end
    longest_fish
end

# ------------------------------------------------------------------------------

class Array
    def merge_sort(&prc)
      return self if self.length <= 1
      prc ||= Proc.new {|a, b| a <=> b}
  
      mid = self.length / 2
      left = self[0... mid]
      right = self[mid..-1]
  
      left_sorted = left.merge_sort(&prc)
      right_sorted = right.merge_sort(&prc)
  
      Array.merge(left_sorted, right_sorted, &prc)
    end
  
    private
    def self.merge(left, right, &prc)
      res = []
  
      while !left.empty? && !right.empty?
        if prc[left.first, right.first] == -1
          res << left.shift
        else
          res << right.shift
        end
      end
  
      res + left + right
    end
end

# Find the longest fish in O(n log n) time.
def dominant_octopus(fishes)
    prc = Proc.new { |a, b| a.length <=> b.length }
    sorted_fishes = fishes.merge_sort(&prc)
    sorted_fishes.last
end

# ------------------------------------------------------------------------------

# Find the longest fish in O(n) time.
def clever_octopus(fishes)
    longest_fish = ""
    fishes.each do |fish|
        longest_fish = fish if fish.length > longest_fish.length
    end

    longest_fish
end

# ------------------------------------------------------------------------------
# fishes =
#     [
#         'fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish',
#         'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'
#     ]
# p sluggish_octopus(fishes)
# p dominant_octopus(fishes)
# p clever_octopus(fishes)

# time_sluggish = Benchmark.measure{ sluggish_octopus(fishes) }
# time_dominant = Benchmark.measure{ dominant_octopus(fishes) }
# time_clever   = Benchmark.measure{ clever_octopus(fishes)   }
# puts " ".ljust(25) + "CPU time".ljust(11) + "System time".ljust(11) + "Total time".ljust(11) + "Real time"
# puts "Sluggish Octopus: ".ljust(25) + "#{time_sluggish.real}"
# puts "Dominant Octopus: ".ljust(25) + "#{time_dominant.real}"
# puts "Clever Octopus: ".ljust(25) + "#{time_clever}"

# ------------------------------------------------------------------------------

# O(n) time.
def slow_dance(dir, tiles_arr)
    tiles_arr.each_with_index do |tile, i|
        return i if dir == tile
    end
end

# ------------------------------------------------------------------------------

# O(1) time
def fast_dance(dir, new_tiles_ds)
    new_tiles_ds[dir]
end

# ------------------------------------------------------------------------------

# tiles_array =
#     [
#         "up", "right-up", "right", "right-down",
#         "down", "left-down", "left",  "left-up"
#     ]

# new_tiles_data_structure =
#     {
#         "up" => 0,
#         "right-up" => 1,
#         "right" => 2,
#         "right-down" => 3,
#         "down" => 4,
#         "left-down" => 5,
#         "left" => 6,
#         "left-up" => 7
#     }

# p slow_dance("up", tiles_array)
# p slow_dance("right-down", tiles_array)

# p fast_dance("up", new_tiles_data_structure)
# p fast_dance("right-down", new_tiles_data_structure)
