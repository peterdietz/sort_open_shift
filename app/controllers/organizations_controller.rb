require 'rest-client'
class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :shiftscore, :edit, :update, :destroy]

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.all
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
  end

  def refresh
    @updates = 0

    Organization.all.each do |organization|
      response = RestClient::Request.execute(:method => :get,
                                             :url => "https://app.onshift.com/rest/user?organization=#{organization.v2organization_id}&limit=99999",
                                             :cookies => {'tg-token' => Rails.application.config.SCHEDULE_TOKEN})
      rest_employees = JSON.parse(response.to_str)['objs']
      rest_employees.each do |rest_employee|
        employee = Employee.find_by_employee_id(rest_employee['id'])
        if employee
          employee.name = "#{rest_employee['last_name']}, #{rest_employee['first_name']}"
          employee.position=rest_employee['title']

          if employee.changed?
            puts employee.name
            @updates += 1
          end

          employee.save
        end
      end
    end
  end

  def shiftscore
    @day_number = params[:day_number]
    if not @day_number
      @day_number = 0
    end
    @day_number = @day_number.to_i


    @shift_number = params[:shift_number]
    if not @shift_number
      @shift_number = 1
    end
    @shift_number = @shift_number.to_i
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)

    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:name, :v2organization_id)
    end
end
