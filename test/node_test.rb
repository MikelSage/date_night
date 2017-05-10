gem "minitest", "~>5.0"
require "minitest/autorun"
require "minitest/pride"
require "./lib/node"

class NodeTest < Minitest::Test
  def test_has_data
    node = Node.new(98)

    assert_equal 98, node.data
  end

  def test_has_left_link
    node1 = Node.new(50)
    node2 = Node.new(25)

    node1.left_link = node2

    assert_equal node2, node1.left_link
  end

  def test_has_right_link
    node1 = Node.new(50)
    node2 = Node.new(75)

    node1.set_right_link(node2)

    assert_equal node2, node1.right_link
  end

  def test_can_insert_data
    node1 = Node.new(50)

    node1.insert(75)

    assert_equal 75, node1.right_link.data
  end

  def test_knows_if_new_data_is_less_or_greater
  end
end
