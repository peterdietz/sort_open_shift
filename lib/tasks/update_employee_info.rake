require 'rest-client'

desc "I am short, but comprehensive description for my cool task"
task refresh_employees: [:environment] do
  # All your magic here
  # Any valid Ruby code is allowed
  organization_id = Organization.first.v2organization_id

  response = RestClient::Request.execute(:method => :get,
                                         :url => "https://app.onshift.com/rest/user?organization=#{organization_id}&limit=9999999",
                                         :cookies => {'tg-token' => '83a5ba09d2e3d883d6d2f6cf2339b42788cdbeab'})

  puts response

  Organization.first.employee.each do |emp|
    puts "#{organization_id} - #{emp.name}"
  end

end