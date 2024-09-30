class Users::SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  def create
    super do |user|
      if user.receptionist?
        redirect_to patients_path and return
      elsif user.doctor?
        redirect_to doctor_patients_path and return
      end
    end
  end

  protected

  def after_sign_in_path_for(resource)
    if resource.receptionist?
      patients_path
    elsif resource.doctor?
      doctor_patients_path
    else
      root_path
    end
  end
end
