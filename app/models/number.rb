class Number < ActiveRecord::Base

  def self.compare_numbers (number1, number2)
    if number1 == number2
      return true
    else
      return false
    end
  end
end
