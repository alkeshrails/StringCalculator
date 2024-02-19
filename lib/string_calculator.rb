# lib/string_calculator.rb
require_relative 'dependencies'

class StringCalculator
  def self.add(string)
    raise ArgumentError, "Input must be a string" unless string.is_a?(String)

    return 0 if string.empty?
    return string.to_i if StringValidator.numeric?(string)

    # Split by both commas and new lines, then map each part to integer and sum them up
    numbers = string.delete(' ').split(/[,\n]/)
    # Check if the string ends with a comma or \n which indicates invalid input
    raise ArgumentError, "Invalid input" if numbers.any?(&:empty?)

    numbers.map(&:to_i).sum
  end
end
