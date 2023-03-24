class Queue
    def initialize
        @queue = []        
    end

    def enqueue(el)
        @queue.push(el)
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue.first
    end

end

queue = Queue.new
queue.enqueue("Henry")
queue.enqueue("Lisa")
queue.enqueue("Kevin")
queue.enqueue("Jessica")
queue.enqueue("Aiden")
p queue.peek
p queue.dequeue
p queue.peek
p queue.dequeue
p queue.peek

