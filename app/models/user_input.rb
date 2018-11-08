class UserInput < ApplicationRecord
  validates_presence_of :num_of_columns, :csv
  validate :num_of_columns_must_be_in_range
  validate :user_input_list_must_be_in_range

  def exploded_csv
    csv.split(/,/)
  end

  def num_of_csv_elements
    exploded_csv.length
  end

  def table_for_display(num_of_columns)
    html_for_table = "<table><tr>"

    #generate column headings
    for i in 1..num_of_columns
      html_for_table << "<td>" + i.to_s + "</td>"
    end
    html_for_table << "</tr>"

    exploded_csv.each_with_index do |csv_element, i|
      #start a new row if it's the first cell of the row
      if (i + 1) % num_of_columns == 1
        html_for_table << "<tr>"
      end

      html_for_table << "<td>" + csv_element.to_s + "</td>"

      #close the row if it's reached the last cell of the row
      if (i + 1) % num_of_columns == 0
        html_for_table << "</tr>"
      elsif i+1 == num_of_csv_elements # reached the last element
        num_of_empty_cells = num_of_columns - exploded_csv.length % num_of_columns
        num_of_empty_cells.times do
          html_for_table << "<td>&nbsp</td>"
        end # fill any empty cells in last row
        html_for_table << "</tr>"
      end
    end

    html_for_table << "</table>"

    html_for_table
  end

  def num_of_columns_must_be_in_range
    if !num_of_columns.between?(2, 10)
      errors.add(:num_of_columns, "must be between 2 and 10.")
    end
  end

  def user_input_list_must_be_in_range
    if !num_of_csv_elements.between?(1, 100)
      errors.add(:csv, "/user input list must have 1-100 elements.")
    end
  end
end


