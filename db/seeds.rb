# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


grand_village = Organization.create({name: 'Grand Village', v2organization_id: '1029'})
peter = Employee.create({organization: grand_village, name: 'Dietz, Peter', position: 'STNA', employee_id: '123'})


peter_shifts = JSON.parse(File.read('tempEmp.json'))

peter_shifts.each do |shift|
  Score.create({employee: peter,
                         hourOffset: shift['hourOffset'],
                         shiftCount: shift['shiftCount'],
                         recentShifts: shift['recentShifts'],
                         nonRecentShifts: shift['nonRecentShifts'],
                         SHITS: shift['SHITS']})
end