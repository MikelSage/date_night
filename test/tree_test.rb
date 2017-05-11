require "minitest/autorun"
require "minitest/pride"
require "./lib/tree"
require "pry"

class TreeTest < Minitest::Test
  def test_default_root_node_is_nil
    tree = Tree.new

    assert_nil tree.root
  end

  def test_can_insert_node
    tree = Tree.new

    depth = tree.insert(50, 'Title')

    assert_instance_of Node, tree.root
    assert_equal 50, tree.root.data['Title']
    assert_equal 0, depth
  end

  def test_can_insert_two_values
    tree = Tree.new

    depth1 = tree.insert(50, 'Title')
    depth2 = tree.insert(75, 'Title2')
    # binding.pry

    assert_equal 50, tree.root.data['Title']
    assert_equal 75, tree.root.right_child.data['Title2']
    assert_equal 0, depth1
    assert_equal 1, depth2
  end

  def can_insert_more_values
    tree = Tree.new

    depth1 = tree.insert(50, 'Title')
    depth2 = tree.insert(75, 'Title2')
    depth3 = tree.insert(25, 'Title3')
    depth4 = tree.insert(90, 'Title4')

    assert_equal 50, tree.root.data['Title']
    assert_equal 75, tree.root.right_child.data['Title2']
    assert_equal 25, tree.root.left_child.data['Title3']
    assert_equal 90, tree.root.right_child.right_child.data['Title4']
    assert_equal 0, depth1
    assert_equal 1, depth2
    assert_equal 1, depth3
    assert_equal 2, depth4
  end

  def test_include_no_root_is_nil
    tree = Tree.new

    refute tree.include?(50)
  end

  def test_include_number
    tree = Tree.new

    tree.insert(50, 'Title')

    assert tree.include?(50)
    refute tree.include?(30)
  end

  def test_include_with_two_nodes
    tree = Tree.new

    tree.insert(50, 'Title')
    tree.insert(75, 'Title2')

    assert tree.include?(50)
    assert tree.include?(75)
    refute tree.include?(43)
  end

  def test_include_with_more_nodes
    tree = Tree.new

    tree.insert(50, 'Title')
    tree.insert(75, 'Title2')
    tree.insert(25, 'Title3')
    tree.insert(90, 'Title4')

    assert tree.include?(50)
    assert tree.include?(75)
    assert tree.include?(25)
    assert tree.include?(90)
    refute tree.include?(43)
  end

  def test_no_nodes_depth
    tree = Tree.new

    assert_nil tree.depth_of(50)
  end

  def test_depth_with_root
    tree = Tree.new

    tree.insert(50, 'Title')

    assert_equal 0, tree.depth_of(50)
  end

  def test_depth_with_1_level
    tree = Tree.new

    tree.insert(50, 'Title')
    tree.insert(25, 'Title2')

    assert_equal 1, tree.depth_of(25)
  end

  def test_depth_with_more_levels
    tree = Tree.new

    tree.insert(50, 'Title')
    tree.insert(75, 'Title2')
    tree.insert(25, 'Title3')
    tree.insert(12, 'Title4')
    tree.insert(35, 'Title5')
    tree.insert(65, 'Title6')
    tree.insert(6, 'Title7')
    tree.insert(70, 'Title8')

    # binding.pry
    assert_equal 2, tree.depth_of(12)
    assert_equal 2, tree.depth_of(65)
    assert_equal 3, tree.depth_of(70)
    assert_equal 3, tree.depth_of(6)
  end

  def test_depth_of_missing_number
    tree = Tree.new

    tree.insert(50, 'Title')
    tree.insert(75, 'Title2')
    tree.insert(25, 'Title3')
    tree.insert(12, 'Title4')
    tree.insert(35, 'Title5')
    tree.insert(65, 'Title6')
    tree.insert(6, 'Title7')

    assert_nil tree.depth_of(13)
    assert_nil tree.depth_of(80)
  end

  def test_max_with_no_nodes_is_nil
    tree = Tree.new

    assert_nil tree.max
  end

  def test_max_with_root_only
    tree = Tree.new
    test_data = {'Title' => 50}

    tree.insert(50, 'Title')

    assert_equal test_data, tree.max
  end

  def test_max_with_two_nodes
    tree = Tree.new
    test_max = {'Title2' => 75}

    tree.insert(50, 'Title')
    tree.insert(75, 'Title2')

    assert_equal test_max, tree.max
  end

  def test_max_with_more_nodes
    tree = Tree.new
    test_max = {'Title8' => 95}

    tree.insert(50, 'Title')
    tree.insert(75, 'Title2')
    tree.insert(25, 'Title3')
    tree.insert(12, 'Title4')
    tree.insert(35, 'Title5')
    tree.insert(65, 'Title6')
    tree.insert(6, 'Title7')
    tree.insert(95, 'Title8')

    assert_equal test_max, tree.max
  end

  def test_min_with_no_nodes_is_nil
    tree = Tree.new

    assert_nil tree.min
  end

  def test_min_with_root_only
    tree = Tree.new
    test_min = {'Title' => 50}

    tree.insert(50, 'Title')

    assert_equal test_min, tree.min
  end

  def test_min_with_two_nodes
    tree = Tree.new
    test_min = {'Title2' => 25}

    tree.insert(50, 'Title')
    tree.insert(25, 'Title2')

    assert_equal test_min, tree.min
  end

  def test_min_with_more_nodes
    tree = Tree.new
    test_min = {'Title7' => 6}

    tree.insert(50, 'Title')
    tree.insert(75, 'Title2')
    tree.insert(25, 'Title3')
    tree.insert(12, 'Title4')
    tree.insert(35, 'Title5')
    tree.insert(65, 'Title6')
    tree.insert(6, 'Title7')
    tree.insert(95, 'Title8')

    assert_equal test_min, tree.min
  end

  def test_sort_with_empty_tree_returns_nil
    tree = Tree.new

    assert_nil tree.sort
  end

  def test_sort_with_root_only
    tree = Tree.new

    tree.insert(50, 'Title')

    assert_equal [{'Title' => 50}], tree.sort
  end

  def test_sort_with_depth_of_one
    tree = Tree.new

    tree.insert(50, 'Title')
    tree.insert(75, 'Title2')
    tree.insert(25, 'Title3')

    assert_equal [{'Title3' => 25}, {'Title' => 50}, {'Title2' => 75}], tree.sort
  end


  def test_sort_with_more_depth
    tree = Tree.new
    sorted_test =[
      {'Title8' => 6},
      {'Title4' => 12},
      {'Title3' => 25},
      {'Title5' => 30},
      {'Title' => 50},
      {'Title6' => 60},
      {'Title2' => 75},
      {'Title7' => 90},
      {'Title9' => 100}
    ]

    tree.insert(50, 'Title')
    tree.insert(75, 'Title2')
    tree.insert(25, 'Title3')
    tree.insert(12, 'Title4')
    tree.insert(30, 'Title5')
    tree.insert(60, 'Title6')
    tree.insert(90, 'Title7')
    tree.insert(6, 'Title8')
    tree.insert(100, 'Title9')

    assert_equal sorted_test, tree.sort
  end

  def test_load_with_one_entry
    tree = Tree.new
    test_data = {'Title' => 50}

    tree.load('test/one_entry_test.txt')

    assert_equal test_data, tree.root.data
  end

  def test_load_with_two_entries
    tree = Tree.new
    test_root_data = {'Title' => 50}
    test_left_data = {'Title2' => 25}

    tree.load('test/two_entry_test.txt')

    assert_equal test_root_data, tree.root.data
    assert_equal test_left_data, tree.root.left_child.data
  end

  def test_load_with_more_entries
    tree = Tree.new
    test_scores = [34, 63, 22, 84, 41, 10]
    sorted_test =[
      {'I Love You Phillip Morris' => 10},
      {'Experimenter' => 22},
      {'Hannibal Buress: Comedy Camisado' => 34},
      {'Love' => 41},
      {'Meet My Valentine' => 63},
      {'French Dirty' => 84}
    ]

    tree.load('test/multiple_entries_test.txt')

    test_scores.each do |score|
      assert tree.include?(score)
    end

    assert_equal sorted_test, tree.sort
  end
end
