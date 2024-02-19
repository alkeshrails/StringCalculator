# frozen_string_literal: true

require_relative 'dependencies'
# Performs calculations on strings containing numbers.
class StringCalculator
  def self.add(string)
    raise ArgumentError, 'Input must be a string' unless string.is_a?(String)

    return 0 if string.empty?
    return string.to_i if StringValidator.numeric?(string)

    delimiter = ',' # Default delimiter

    # Check if the string starts with a custom delimiter declaration
    if string.start_with?('//')
      delimiter_line, numbers = string.split("\n", 2)
      delimiter = delimiter_line[2..] # Extract the custom delimiter from the declaration
    else
      numbers = string
    end

    splitted_numbers = extract_numbers(numbers, delimiter)
    validate_numbers(splitted_numbers)
    splitted_numbers.map(&:to_i).sum
  end

  def self.extract_numbers(numbers, delimiter)
    # Split the numbers using the delimiter and calculate the sum
    numbers.split(/#{Regexp.escape(delimiter)}|,|\n/)&.map(&:strip)
  end

  def self.validate_numbers(numbers)
    raise ArgumentError, 'Invalid input' if numbers.any? { |num| num.empty? || num.match(/\s{1,}/) }

    # Check for negative numbers and raise an exception if found
    negatives = numbers.select { |num| num.to_i.negative? }
    raise ArgumentError, "Negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?
  end

  private_class_method :extract_numbers, :validate_numbers
end
