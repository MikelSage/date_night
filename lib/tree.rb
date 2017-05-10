require "pry"
require "./lib/node"

class Tree
  attr_reader :root
  def initialize
    @root = nil
  end

  def insert(score, title)
    if @root
      @root.insert(score, title)
    else
      @root = Node.new(score, title)
      0
    end
  end

  def include?(num)
    if @root
      @root.include?(num)
    end
  end

  def depth_of(num)
    if @root
      @root.depth_of(num)
    end
  end

  def max
    if @root
      @root.max
    end
  end

  def min
    if @root
      @root.min
    end
  end

  def sort
    if @root
      @root.sort
    end
  end
end

# tree = Tree.new
#
# tree.insert(50, 'Title')
# tree.insert(75, 'Title2')
# tree.insert(25, 'Title3')
#
# p tree.sort
