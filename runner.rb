# frozen_string_literal: true

require_relative 'lib/string_calculator'
# Runner class to demonstrate StringCalculator functionality

class Runner
  def initialize
    @calculator = StringCalculator.new
  end

  def run
    string = ARGV[0]
    puts "sum = #{@calculator.add(string)}"
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end
end

Runner.new.run
