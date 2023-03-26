class GraphNode
    attr_reader :value, :neighbors

    def initialize(value)
        @value = value
        @neighbors = []
    end

    def neighbors=(nodes)
        @neighbors = nodes
    end
end

def bfs(starting_node, target_value)
    queue = []
    visited = []
    queue << starting_node
    while !queue.empty?
        node = queue.shift
        break if visited.include?(node) 
        if node.value == target_value
            return node
        else
            queue += node.neighbors
        end
        visited << node
    end
    nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]


p bfs(a, "b")
p bfs(a, "f")