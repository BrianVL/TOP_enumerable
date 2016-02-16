module Enumerable
  # Own interpretation of .each method
  def my_each
    i = 0
    while i < self.size
      yield self[i]
      i += 1
    end
  end

  # Own interpretation of .each_with_index method
  def my_each_with_index
    i = 0
    while i < self.size
      yield self[i], i
      i += 1
    end
  end

  # Own interpretation of .select method
  def my_select
    array = []
    self.my_each do |item|
      if (yield item) == true
        array << item
      end
    end
    array
  end

  # Own interpretation of .all? method
  def my_all?

  end

  # Own interpretation of .any? method
  def my_any?

  end

  # Own interpretation of .none? method
  def my_none?

  end

  # Own interpretation of .count method
  def my_count

  end

  # Own interpretation of .map method
  def my_map

  end

  # Own interpretation of .inject method
  def my_inject

  end
  
end



# Test for my_each
#[1,2,3,4,5,6].my_each {|num| puts "Test my_each: #{num*3}"}

# Test for my_each_with_index
#[1,2,3,4,5,6].my_each_with_index {|num, index| puts "Test my_each_with_index: #{num*3}, #{index}"}

# Test for my_select
#p [1,2,3,4,5,6].my_select {|num| num%2==0 }
