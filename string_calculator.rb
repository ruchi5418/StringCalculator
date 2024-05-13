require 'rspec/autorun'

def StringCalculator(numbers)
  return 0 if numbers.empty?
  numbers.to_i if numbers.size == 1

  numbers.split(",").map(&:to_i).sum
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
end