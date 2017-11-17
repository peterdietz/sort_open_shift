class Score < ApplicationRecord
  belongs_to :employee

  def self.monday_first_shift(employee)
    return get_shift_score(employee, 0, 1)
  end

  # day of week 0=monday, 6 = Sunday
  # shift_number 1 = first 7a-3p, 2 = second 3p-11p, 3 = third 11p-7a
  def self.get_shift_score(employee, day_of_week, shift_number)
    # 7a - 3p
    first_shift_start = 7
    first_shift_end = 15
    # 3p - 11p
    second_shift_start = 15
    second_shift_end = 23
    # 11p - 7a
    third_shift_start = 23
    third_shift_end = 7

    if shift_number == 1
      return employee.scores.where("hourOffset > #{first_shift_start + day_of_week*24} and hourOffset < #{first_shift_end + day_of_week*24}").average("V1SHITS")
    elsif shift_number == 2
      return employee.scores.where("hourOffset > #{second_shift_start + day_of_week*24} and hourOffset < #{second_shift_end + day_of_week*24}").average("V1SHITS")
    elsif shift_number == 3
      if (third_shift_end + 24 + day_of_week*24) < 167
        return employee.scores.where("hourOffset > #{third_shift_start + day_of_week*24} and hourOffset < #{third_shift_end + 24 + day_of_week*24}").average("V1SHITS")
      else
        # 0-167.. get Sunday 11p (167) to Monday 7a (6)
        return employee.scores.where("hourOffset = 167 or hourOffset < 7").average("V1SHITS")
      end
    end
  end

end
