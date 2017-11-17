class Score < ApplicationRecord
  belongs_to :employee

  def self.monday_first_shift(employee)
    # 7a - 3p
    first_shift_start = 7
    first_shift_end = 15
    # 3p - 11p
    second_shift_start = 15
    second_shift_end = 23
    # 11p - 7a
    third_shift_start = 23
    third_shift_end = 7

    n=0
    return employee.scores.where("hourOffset > #{first_shift_start + n*24} and hourOffset < #{first_shift_end + n*24}").average("V1SHITS")

  end
end
