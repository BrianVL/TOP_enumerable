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
    status = true
    self.my_each do |item|
      if (yield item) != true
        status = false
      end
    end
    status
  end

  # Own interpretation of .any? method
  def my_any?
    status = false
    self.my_each do |item|
      if (yield item) == true
        status = true
      end
    end
    status
  end

  # Own interpretation of .none? method
  def my_none?
    status = true
    self.my_each do |item|
      if (yield item) == true
        status = false
      end
    end
    status
  end

  # Own interpretation of .count method
  def my_count
    array = self.my_select {|item| yield item}
    array.length
  end

  # Own interpretation of .map method
  def my_map
    array = []
    self.my_each do |item|
      array << (yield item)
    end
    array
  end

  # Own interpretation of .inject method
  def my_inject(memo=nil)
    self.to_a.my_each do |item|
      memo == nil ? memo = item : memo = (yield memo, item)
    end
    memo
  end

  # Map function which takes a proc
  def my_map_mod(&proc)
    array = []
    self.my_each do |item|
      array << proc.call(item)
    end
    array
  end

end

def multiply_els(array)
  array.my_inject(1) {|product, item| product*item }
end

# Test for my_each
#[1,2,3,4,5,6].my_each {|num| puts "Test my_each: #{num*3}"}

# Test for my_each_with_index
#[1,2,3,4,5,6].my_each_with_index {|num, index| puts "Test my_each_with_index: #{num*3}, #{index}"}

# Test for my_select
#p [1,2,3,4,5,6].my_select {|num| num%2==0 }

#Test for my_all?
#p ["foo","bar","do"].my_all? {|str| str.length == 3 }

#Test for my_any?
#p ["fo","bar","do"].my_any? {|str| str.length == 3 }

#Test for my_none?
#p ["fo","bar","do"].my_none? {|str| str.length == 3 }

# Test for my_count
#p [1,2,3,4,5,6].my_count {|num| num%2==0 }

# Test for my_map
#p [1,2,3,4,5,6].my_map {|num| num**3 }

# Test for my_inject
# p (5..10).my_inject {|sum, num| sum + num }

# Test for my_inject, find the longest word
# longest = %w{ cat sheep bear }.my_inject do |memo, word|
#    memo.length > word.length ? memo : word
# end
#
# p longest

# Test for my_inject, multiply
# p (5..10).my_inject(1) { |product, n| product * n }

# Test for multiply_els
# p multiply_els([2,4,5])

# Test for my_map_mod
my_proc = Proc.new {|num| num**3 }
p [1,2,3,4,5,6].my_map_mod(&my_proc)
