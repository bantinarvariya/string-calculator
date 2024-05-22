# frozen_string_literal: true

# string calculator class
class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/
    if numbers.start_with?('//')
      delimiter, numbers = numbers[2..].split("\n", 2)
      delimiter = Regexp.escape(delimiter)
    end

    nums = numbers.split(/#{delimiter}/).map(&:to_i)
    negatives = nums.select(&:negative?)

    raise "negative numbers not allowed #{negatives.join(', ')}" unless negatives.empty?

    nums.sum
  end
end
