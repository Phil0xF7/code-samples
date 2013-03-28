require 'minitest/spec'
require 'minitest/autorun'

class Robot
  attr_reader :name

  def initialize
    make_name
  end

  def make_name
    @r = Random.new()
    @name = random_name
  end

  def random_name
    n = @r.rand(1000)
    l1 = @r.rand(26) + 65
    l2 = @r.rand(26) + 65
    name = ''
    name << l1
    name << l2
    name << n.to_s
  end

  def reset
    make_name
  end

end


# Tests
describe 'Robots' do
  it 'should have the same name 3 times' do
    robot1 = Robot.new
    name = robot1.name
    robot1.name.must_equal name
    robot1.name.must_equal name
    robot1.name.must_equal name
  end

  it 'should have different names' do
    robot1 = Robot.new
    robot2 = Robot.new
    robot1.name.wont_equal robot2.name
  end

  it 'should have a new name when reset is called' do
    robot1 = Robot.new
    old_name = robot1.name
    robot1.reset
    old_name.wont_equal robot1.name
  end

end