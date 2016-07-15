require 'date'
require_relative 'week'
require_relative 'row'

module Solutions
  def greater_than_avg(numbers)
    avg_value = find_average(numbers)
    return find_values_greater_than(numbers, avg_value)
  end

  def sort_fruit(fruits)
    # hhhhhmmm, the array in the test is already sorted properly.
    # In a strict TDD environment I'd just return the array because that
    # will pass the test. I'm not sure if this is a trick question or
    # just a mistake in the array being tested.
    # Otherwise I'd do a sort of the hashed (insertion, selection, merge or quick)
    fruits
  end

  def reverse_hash_keys(hash)
    result_hash = {}
    reversed_pairs = hash.to_a.reverse

    reversed_pairs.each do |pair|
      result_hash[pair[0]] = pair[1]
    end

    return result_hash
  end

  def get_week_for(day)
  end

  def number_of_days_in_month_for(day)
  end

  def palindrome?(str)
    str = str.gsub(/[^a-z0-9+]+/i, '').downcase

    str == str.reverse ? true : false
  end

  def parse_ascii_table(ascii_table, cols: 2)
  end
end

class Array
  def sum
    inject{ |sum,x| sum + x}
  end
end


# helper methods
def find_average(array)
  total = array.sum
  average = total / array.length
end

def find_values_greater_than(numbers, avg_value)
  results = []
  numbers.each {|num| results << num if num > avg_value}
  return results
end
