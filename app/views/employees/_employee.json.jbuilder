json.extract! employee, :id, :name, :employee_id, :position, :organization_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
