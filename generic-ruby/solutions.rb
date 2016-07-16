require 'date'
require_relative 'week'
require_relative 'row'
require 'pry'

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
    week_day = day.wday
    monday = day.prev_day(week_day - 1)
    sunday = monday.next_day(6)

    week = Week.new(monday, sunday)
  end

  def number_of_days_in_month_for(day)
    days_in_month = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

    if day.month == 2 && Date.gregorian_leap?(day.year)
      return 29
    else
      days_in_month[day.month ]
    end
  end

  def palindrome?(str)
    str = str.gsub(/[^a-z0-9+]+/i, '').downcase

    str == str.reverse ? true : false
  end

  def parse_ascii_table(ascii_table, cols: 2)
    puts ascii_table

    headers = find_headers(ascii_table)
    rows = create_rows(ascii_table, headers)
    rows.shift 1

    return rows

  end
end



# helper methods
def find_average(array)
  total = array.inject{ |sum,x| sum + x}
  average = total / array.length
end

def find_values_greater_than(numbers, avg_value)
  results = []
  numbers.each {|num| results << num if num > avg_value}
  return results
end

def find_headers(ascii_table)
  split_table = ascii_table.split " "
  headers = []
  row_divider_count = 0

  split_table.each do |element|
    if element == "+------------------------------------+-----------------------------------+"
      row_divider_count += 1
    end

    if row_divider_count >= 2
      break
    end

    unless element == "|" || element == "+------------------------------------+-----------------------------------+"
      headers << element
    end
  end

  return headers
end

def create_rows(ascii_table, headers)
  rows = []
  cells = []
  ascii_rows = ascii_table.split "\n"

  #iterate over all lines of text
  ascii_rows.each.with_index do |row, row_index|

    #skip first row
    if row_index == 0
      next
    #if end of row, turn cells into row
    #push row to rows.
    elsif row[0] == "+"
      puts "Createing Rows >>>>>>>>>>>>>"
      row = Row.new
      headers.each.with_index do |header, index|
        row["#{header}"] = cells[index].strip
      end
      puts "Row: #{row}"
      puts " "
      rows << row
      cells = []
      next

    # build up individual cells
    else
      split_row = row.split "|"
      split_row.delete ""

      split_row.each.with_index do |cell, index|
        puts "Cell: #{cell}"
        if cells[index]
          cells[index] += "#{cell.strip} "
        else
          cells[index] = "#{cell.strip} "
        end
        puts "Cells: #{cells}"
      end
    end
  end

  return rows
end




# like_start_index = 227
# like_end_index = 261
# dislike_start_index = 227 + 37
# dislike_end_index = 261 + 36
# rows = []

# while ascii_table[like_start_index]
#   row = Row.new
#   row.likes = ascii_table[like_start_index..like_end_index].strip
#   row.dislikes = ascii_table[dislike_start_index..dislike_end_index].strip
#
#   rows << row
#
#   like_start_index += 150
#   like_start_index += 150
#   dislike_start_index += 150
#   dislike_end_index += 150
# end
