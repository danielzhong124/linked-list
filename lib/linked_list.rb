# frozen_string_literal: true

require_relative 'node'

class LinkedList
  attr_reader :head

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      tail.next_node = Node.new(value)
    end
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def size
    curr = @head
    count = 0
    until curr.nil?
      count += 1
      curr = curr.next_node
    end

    count
  end

  def tail
    return nil if @head.nil?

    curr = @head
    curr = curr.next_node until curr.next_node.nil?

    curr
  end

  def at(index)
    return nil if index.negative?

    curr = @head
    index.times do
      return nil if curr.nil?

      curr = curr.next_node
    end

    curr
  end

  def pop
    return if @head.nil?

    if @head.next_node.nil?
      @head = nil
    else
      new_tail = @head
      new_tail = new_tail.next_node until new_tail.next_node.next_node.nil?
      new_tail.next_node = nil
    end
  end

  def contains?(value)
    curr = @head
    until curr.nil?
      return true if curr.value == value

      curr = curr.next_node
    end

    false
  end

  def find(value)
    index = 0
    curr = @head
    until curr.nil?
      return index if value == curr.value

      index += 1
      curr = curr.next_node
    end

    nil
  end

  def to_s
    curr = @head
    str = ''
    until curr.nil?
      str += "( #{curr.value} ) -> "
      curr = curr.next_node
    end

    "#{str}nil"
  end

  def insert_at(value, index)
    if index.zero?
      prepend(value)
    else
      prev = at(index - 1)
      prev.next_node = Node.new(value, prev.next_node) unless prev.nil?
    end
  end

  def remove_at(index)
    return if @head.nil?

    if index.zero?
      @head = @head.next_node
    else
      prev = at(index - 1)
      return if prev.nil? || prev.next_node.nil?

      prev.next_node = prev.next_node.next_node
    end
  end
end
