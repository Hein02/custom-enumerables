module Enumerable
  # Your code goes here
  def my_each_with_index
    return enum_for(__method__) unless block_given?

    i = 0
    for value in self do
      yield value, i
      i += 1
    end
    self
  end

  def my_select
    return enum_for(__method__) unless block_given?

    selected = []

    for value in self do
      selected << value if yield(value)
    end

    selected
  end

  def my_all?
    return enum_for(__method__) unless block_given?

    match = true
    for value in self do
      # if one element does not match return false
      return false unless match = yield(value)
    end

    match
  end

  def my_any?
    return enum_for(__method__) unless block_given?

    match = false
    for value in self do
      # if one element matches return true
      return true if match = yield(value)
    end
    match
  end

  def my_none?
    return enum_for(__method__) unless block_given?

    match = false
    for value in self do
      # if one element matches return false
      return false if match = yield(value)
    end
    true
  end

  def my_count
    return self.size unless block_given?

    count = 0
    for value in self do
      count += 1 if yield(value)
    end
    count
  end

  def my_map
    new_arr = []
    for value in self do
      new_arr << yield(value)
    end
    new_arr
  end

  def my_inject(initial_value = self[0])
    accumulator = initial_value
    for value in self do
      accumulator = yield(accumulator, value)
    end
    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return enum_for(__method__) unless block_given?

    for value in self do
      yield value
    end
    self
  end
end
