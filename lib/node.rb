require "pry"
class Node
  attr_reader :data, :left_child, :right_child
  def initialize(score, title)
    @score = score
    @title = title
    @data = {title => score}
    @left_child = nil
    @right_child = nil
    @sorted = []
  end

  def insert(score, title)
    if score == @data[@title]
      0
    elsif score < @data[@title]
      if @left_child
        1 + left_child.insert(score, title)
      else
        @left_child = Node.new(score, title)
        1
      end
    else
      if @right_child
        1 + right_child.insert(score, title)
      else
        @right_child = Node.new(score, title)
        1
      end
    end
  end

  def include?(num)
    if num == @data[@title]
      true
    elsif num < @data[@title]
      if left_child
        left_child.include?(num)
      else
        false
      end
    else
      if right_child
        right_child.include?(num)
      else
        false
      end
    end
  end

  def depth_of(num)
    if num == @data[@title]
      0
    elsif num < @data[@title]
      if left_child
        1 + left_child.depth_of(num) unless left_child.depth_of(num).nil?
      end
    elsif num > @data[@title]
      if right_child
        1 + right_child.depth_of(num) unless right_child.depth_of(num).nil?
      end
    end
  end

  def max
    if right_child
      right_child.max
    else
      @data
    end
  end

  def min
    if left_child
      left_child.min
    else
      @data
    end
  end

  def sort
		if left_child
			@sorted << left_child.sort
    end
		@sorted << data
		if right_child
			@sorted << right_child.sort
    end

    @sorted.flatten
  end
end
