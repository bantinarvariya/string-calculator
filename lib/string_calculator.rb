# frozen_string_literal: true

# string calculator class
class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/
    nums = numbers.split(/#{delimiter}/).map(&:to_i)
    nums.sum
  end
end
