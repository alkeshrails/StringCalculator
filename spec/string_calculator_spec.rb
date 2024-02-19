# spec/string_calculator_spec.rb
require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  subject { described_class }

  describe "#add" do
    it "returns 0 for an empty string" do
      expect(subject.add("")).to eq(0)
    end

    it "raises ArgumentError for non-string input" do
      expect { subject.add(100) }.to raise_error(ArgumentError, "Input must be a string")
    end

    it "returns the number itself for single number" do
      expect(subject.add("10")).to eq(10)
    end
  end
end
