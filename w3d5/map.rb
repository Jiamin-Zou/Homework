class Map
    def initialize
        @map = []
    end

    def set(key, value)
        pair_idx = @map.index { |pair| pair[0] == key }
        pair_idx ? @map[pair_idx][1] = value : @map.push([key, value])
        value
    end

    def get(key)
        @map.each {|pair| return pair[1] if pair[0] == key}
        nil
    end

    def delete(key)
        value = get(key)
        @map.delete([key, value])
        value
    end

    def show
        deep_dup(@map)
    end

    def deep_dup(arr)
        arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
    end

end

my_map = Map.new
p my_map.set(1,2)
p my_map.set(2,3)
p my_map.set(11,4)
p my_map.set(11,2)
p my_map.set(4,0)

p my_map.show
p my_map.get(11)
p my_map.get(2)
p my_map.get(5) # dne

p my_map.delete(2)
p my_map.delete(12) # dne
p my_map.set(8,19)
p my_map.get(8)
p my_map.show