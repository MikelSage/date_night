require "pry"
require "./lib/node"

class Tree
  attr_reader :root
  def initialize
    @root = nil
  end

  def insert(score, title)
    @root ? @root.insert(score, title) : (@root = Node.new(score, title); 0)
  end

  def include?(num)
    @root.include?(num) if @root
  end

  def depth_of(num)
    @root.depth_of(num) if @root
  end

  def max
    @root.max if @root
  end

  def min
    @root.min if @root
  end

  def sort
    @root.sort if @root
  end

  def load(filename)
    file_to_load = File.open(filename, 'r')

    file_to_load.each do |line|
      split_data = line.split
      insert(split_data[0].to_i, split_data[1..-1].join(' '))
    end
  end
end
