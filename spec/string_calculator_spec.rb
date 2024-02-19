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

    context "for comma-separated numbers" do
      it "returns the sum of numbers" do
        expect(subject.add("11, 22, 33")).to eq(11 + 22 + 33)
      end

      it "remove empty spaces and returns the sum of numbers" do
        expect(subject.add("1 1, 2  2, 3   3")).to eq(11 + 22 + 33)
      end
    end

    context "for new line-separated numbers" do
      it "returns the sum of numbers" do
        expect(subject.add("11\n22\n33")).to eq(11 + 22 + 33)
        expect(subject.add("11,22\n33")).to eq(11 + 22 + 33)
        expect(subject.add("11\n22,33")).to eq(11 + 22 + 33)
      end
    end

    context "for invalid input with comma followed by new line or viceversa" do
      it "raises ArgumentError" do
        expect { subject.add("1,\n2") }.to raise_error(ArgumentError)
        expect { subject.add("1\n,2") }.to raise_error(ArgumentError)
      end
    end

    context "with different delimiters" do
      it "supports custom delimiter" do
        expect(subject.add("//;\n1;2")).to eq(3)
      end

      it "supports custom delimiter with different numbers" do
        expect(subject.add("//;\n1;2;3;4")).to eq(10)
      end

      it "supports custom delimiter with new lines" do
        expect(subject.add("//*\n1\n2*3\n4")).to eq(10)
      end

      it "supports custom delimiter with mixed delimiters" do
        expect(subject.add("//#\n1\n2,3\n4#5")).to eq(15)
      end

      it "raises ArgumentError for invalid input with custom delimiter" do
        expect { subject.add("//;\n1;\n2") }.to raise_error(ArgumentError)
      end
    end
  end
end
