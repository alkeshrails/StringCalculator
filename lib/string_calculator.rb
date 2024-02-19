# lib/string_calculator.rb
require_relative 'dependencies'

class StringCalculator
  def self.add(string)
    raise ArgumentError, "Input must be a string" unless string.is_a?(String)

    return 0 if string.empty?
    return string.to_i if StringValidator.numeric?(string)

    delimiter = ',' # Default delimiter

    # Check if the string starts with a custom delimiter declaration
    if string.start_with?("//")
      delimiter_line, numbers = string.split("\n", 2)
      delimiter = delimiter_line[2..-1] # Extract the custom delimiter from the declaration
    else
      numbers = string
    end

    # Split the numbers using the delimiter and calculate the sum
    splitted_numbers = numbers.delete(' ').split(/#{Regexp.escape(delimiter)}|,|\n/)

    raise ArgumentError, "Invalid input" if splitted_numbers.any?(&:empty?)

    splitted_numbers.map(&:to_i).sum
  end
end
