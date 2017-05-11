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
      @left_child ? 1 + left_child.insert(score, title) : (@left_child = Node.new(score, title); 1)
    else
      @right_child ? 1 + right_child.insert(score, title) : (@right_child = Node.new(score, title); 1)
    end
  end

  def include?(num)
    if num == @data[@title]
      true
    elsif num < @data[@title]
      left_child ? left_child.include?(num) : false
    else
      right_child ? right_child.include?(num) : false
    end
  end

  def depth_of(num)
    if num == @data[@title]
      0
    elsif num < @data[@title]
      1 + left_child.depth_of(num) if depth_not_nil?(left_child, num)
    elsif num > @data[@title]
      1 + right_child.depth_of(num) if depth_not_nil?(right_child, num)
    end
  end

  def depth_not_nil?(child, num)
    child && !child.depth_of(num).nil?
  end

  def max
    right_child ? right_child.max : @data
  end

  def min
    left_child ? left_child.min : @data
  end

  def sort
    @sorted << left_child.sort if left_child
		@sorted << data
    @sorted << right_child.sort if right_child
    @sorted.flatten
  end
end
