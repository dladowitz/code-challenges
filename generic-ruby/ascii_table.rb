
class AsciiTable
  def initialize(ascii_table)
    @ascii_table = ascii_table
    @headers = []
    @body = []
  end

  # builds up individual multi-line cells
  def build_up_cells(cells, row)
    partial_cell = parse_row_to_partial_cell(row)

    partial_cell.each.with_index do |cell, index|
      if cells[index]
        cells[index] += "#{cell.strip} "
      else
        cells[index] = "#{cell.strip} "
      end
    end

    return cells
  end

  def body_in_rows
    ascii_rows = @ascii_table.split "\n" #split up table into ascii_rows
    create_headers(ascii_rows)
    create_body(ascii_rows)
    return @body
  end

  def create_body(ascii_rows)
    cells = []

    #iterate over all lines of ascii rows
    ascii_rows.each.with_index do |row, row_index|
      if row[0] == "+" #if row delimiter found, turn cells into row and push row to rows.
        next if row_index == 0  || row_index == 2 #skip header delimiters.
        row = create_row(cells)
        @body << row
        cells = []
        next

      else # build up individual cells
        next if row_index == 1 #skip header
        cells = build_up_cells(cells, row)
      end
    end
  end

  def create_headers(ascii_rows)
    header_row = ascii_rows[1]
    headers = []
    header_row = parse_row_to_partial_cell(header_row)
    header_row.each do |header|
      @headers << header.strip
    end
  end

  def create_row(cells)
    row = Row.new
    @headers.each.with_index do |header, index|
      row["#{header}"] = cells[index].strip
    end

    return row
  end

  def parse_row_to_partial_cell(row)
    cell_partial = row.split "|"
    cell_partial.delete ""

    return cell_partial
  end
end
