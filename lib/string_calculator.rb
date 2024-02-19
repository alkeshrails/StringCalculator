# lib/string_calculator.rb
class StringCalculator
  def self.add(numbers)
    raise ArgumentError, "Input must be a string" unless numbers.is_a?(String)

    return 0 if numbers.empty?
    numbers.to_i
  end
end
