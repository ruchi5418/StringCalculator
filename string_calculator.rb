require 'rspec/autorun'

def StringCalculator(numbers)
  return 0 if numbers.empty?
  numbers.to_i # single number
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
end