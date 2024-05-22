# frozen_string_literal: true

# string calculator class
class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/
    if numbers.start_with?("//")
      if numbers =~ /^\/\/\[(.+)\]\n/
        delimiter = Regexp.escape($1)
        numbers = numbers.split("\n", 2).last
      elsif numbers =~ /^\/\/(.+)\n/
        delimiter = Regexp.escape($1)
        numbers = numbers.split("\n", 2).last
      end
    end
    
    nums = numbers.split(/#{delimiter}/).map(&:to_i)
    negatives = nums.select(&:negative?)

    raise "negative numbers not allowed #{negatives.join(', ')}" unless negatives.empty?

    nums.reject { |n| n > 1000 }.sum
  end
end
