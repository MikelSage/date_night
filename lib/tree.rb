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
end
