# Node class - data and pointer to next element
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :name

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      tmp = @head
      tmp = tmp.next_node until tmp.next_node.nil?
      tmp.next_node = Node.new(value)
    end
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def size
    count = 1
    tmp = @head
    until tmp.next_node.nil?
      tmp = tmp.next_node
      count += 1
    end
    count
  end

  def head
    @head
  end

  def tail
    current = @head
    current = current.next_node until current.next_node.nil?
    current
  end

  def at(index)
    node_number = 0
    tmp = @head
    size.times do
      return tmp if index.eql? node_number
      tmp = tmp.next_node
      node_number += 1
    end
    nil
  end

  def pop
    current = @head
    until current.next_node.nil?
      previous = current
      current = current.next_node
    end
    previous.next_node = nil
  end

  def contains?(value)
    result = false
    tmp = @head
    until tmp.next_node.nil?
      result = true if tmp.value.eql? value
      tmp = tmp.next_node
    end
    result
  end

  def find(value)
    return nil unless contains?(value)
      
    node_number = 0
    tmp = @head
    (size - 1).times do
      return node_number if value.eql?(tmp.value)
      tmp = tmp.next_node
      node_number += 1
    end
  end

  def to_s
    tmp = @head
    string = ''
    until tmp.next_node.nil?
      string += "( #{tmp.value} ) -> "
      tmp = tmp.next_node
    end
    string += "( #{tmp.value} ) -> nil"
  end

  def insert_at(value, index)
    current = @head
    count = 0
    until count.eql?(index)
      previous = current
      break if previous.eql? nil
      current = current.next_node
      count += 1
    end
    previous.next_node = Node.new(value, current) unless previous.eql? nil
  end

  def remove_at(index)
    current = @head
    count = 0
    if index.zero?
      @head = current.next_node
    else
      until count.eql?(index)
        previous = current
        break if previous.eql? nil
        current = current.next_node
        count += 1
      end
      previous.next_node = current.next_node unless previous.eql? nil
    end
  end
end

my_list = LinkedList.new
my_list.append('one')
my_list.append('two')
my_list.append('three')
my_list.prepend('four')
my_list.pop

# p my_list.to_s
# p my_list.find('four')
# p my_list.tail
# p my_list.head

my_list.insert_at('insert', 2)
p my_list.to_s
