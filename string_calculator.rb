require 'rspec/autorun'
require 'byebug'

def StringCalculator(numbers)
    return 0 if numbers.empty?

    return numbers.to_i if numbers.size == 1

    delimiter = ","

    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers[(numbers.index("\n") + 1)..-1]
    end

    numbers = numbers.split(/#{delimiter}|\n/)

    sum = 0
    negatives = []
    byebug

    numbers.each do |num|
      if num.to_i.negative?
        negatives << num
      else
        sum += num.to_i
      end
    end

    raise "Negative numbers not allowed: #{negatives.join(',')}" unless negatives.empty?

    sum
end

describe "#StringCalculator" do 
    context "with an empty string" do
        it "returns 0" do
            expect(StringCalculator("")).to eq(0)
        end
    end

    context "with a single number on a string" do
        it "returns the number itself" do
            expect(StringCalculator("1")).to eq(1)
        end
    end

    context "with two numbers" do
        it "returns the sum of the numbers" do
            expect(StringCalculator("1,2")).to eq(3)
        end
    end

    context "with newlines between numbers" do
        it "returns the sum of the numbers" do
            expect(StringCalculator("1\n2,3")).to eq(3)
        end
    end
  
    context "with custom delimiter" do
        it "returns the sum of the numbers" do
            expect(StringCalculator("//;\n1;2")).to eq(3)
        end
    end
  
    context "with negative numbers" do
        it "raises an exception" do
            expect(StringCalculator("-1,2")).to raise_error("Negative numbers not allowed: -1")
        end
    end
  
    context "with multiple negative numbers" do
        it "raises an exception" do
          expect { StringCalculator("-1,-2,3,-4") }.to raise_error("Negative numbers not allowed: -1,-2,-4")
        end
    end
end