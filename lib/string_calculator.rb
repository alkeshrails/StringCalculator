# lib/string_calculator.rb
require_relative 'dependencies'

class StringCalculator
  def self.add(string)
    raise ArgumentError, "Input must be a string" unless string.is_a?(String)

    return 0 if string.empty?
    return string.to_i if StringValidator.numeric?(string)

    string.delete(' ').split(',').map(&:to_i).sum
  end
end
