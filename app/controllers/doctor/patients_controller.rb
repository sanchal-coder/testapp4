# app/controllers/doctor/patients_controller.rb
class Doctor::PatientsController < ApplicationController
  # Ensure the user is authenticated before accessing any actions in this controller
  before_action :authenticate_user!

  # Ensure the user has the doctor role before allowing access to the index action
  before_action :check_doctor

  def index
    # Fetch all registered patients
    @patients = Patient.all

    # Group patients by the day they were registered
    @patients_by_day = Patient.group_by_day(:created_at).count
  end

  private

  # Custom method to check if the current user is a doctor
  def check_doctor
    redirect_to root_path, alert: "Not authorized" unless current_user.doctor?
  end
end
