require 'date'
require_relative 'week'
require_relative 'row'

module Solutions
  def greater_than_avg(numbers)
    avg_value = find_average(numbers)
    return find_values_greater_than(numbers, avg_value)
  end

  def sort_fruit(fruits)
  end

  def reverse_hash_keys(hash)
  end

  def get_week_for(day)
  end

  def number_of_days_in_month_for(day)
  end

  def palindrome?(str)
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
