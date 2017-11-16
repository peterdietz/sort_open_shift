# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


grand_village = Organization.create({name: 'Grand Village', v2organization_id: '1029'})

employee_shift_files = Dir['data/1029/*.json']

employee_shift_files.each do |employee_file_name|
  employee_id = File.basename(employee_file_name, '.json')
  employee = Employee.create({organization: grand_village, name: "Person #{employee_id}", position: 'unset?', employee_id: employee_id})

  employee_shifts = JSON.parse(File.read(employee_file_name))

  employee_shifts.each do |shift|
  Score.create({employee: employee,
                hourOffset: shift['hourOffset'],
                shiftCount: shift['shiftCount'],
                recentShifts: shift['recentShifts'],
                nonRecentShifts: shift['nonRecentShifts'],
                recentRequestShifts: shift['recentRequestShifts'],
                nonRecentRequestShifts: shift['nonRecentRequestShifts'],
                recentCallOffs: shift['recentCallOffs'],
                nonRecentCallOffs: shift['nonRecentCallOffs'],
                recentNoShow: shift['recentNoShow'],
                nonRecentNoShow: shift['nonRecentNoShow'],
                V1SHITS: shift['V1SHITS'],
                V2SHITS: shift['V2SHITS']
               })
  end
end