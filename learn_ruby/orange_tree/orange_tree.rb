class OrangeTree
  attr_reader :height, :age, :num_oranges, :oranges_eaten
  def initialize(age, height)
    @age, @height = age, height
    @num_oranges = 0
    @oranges_eaten = 0
  end

  def one_year_passes
    if tree_condition == 'alive'
      @age += 1
      @height += 2
      @age < 2 ? @num_oranges : @num_oranges += 5
    else
      'the orange tree integrates itself further back into the Earth'
    end

  end
  
  def tree_condition
    @age < 80 ? 'alive' : 'dead'
  end
  
  def eat_orange(num)
    if tree_condition == 'alive'
      if @num_oranges > num
        @num_oranges -= num
        @oranges_eaten += num
      else
        "you can't eat an orange that isn't there.  There are #{num_oranges} oranges available to eat"
      end
    else
      'This tree will never produce fruit again'
    end
  end
end