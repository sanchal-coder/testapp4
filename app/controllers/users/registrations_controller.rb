class Users::RegistrationsController < Devise::RegistrationsController
  # Override the create method
  def create
    build_resource(sign_up_params)  # Build a new resource (User) from the form parameters
    resource.role = sign_up_params[:role]  # Assign the role based on strong parameters

    if resource.save  # Save the new user to the database
      # Handle successful registration
      set_flash_message! :notice, :signed_up
      sign_up(resource_name, resource)
      respond_with resource, location: after_sign_up_path_for(resource)
    else
      # Log validation errors for debugging
      Rails.logger.error(resource.errors.full_messages)  # Log errors
      # Handle registration failure
      clean_up_passwords resource
      respond_with resource do |format|
        format.html { render :new }
      end
    end
  end

  protected

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end

  # Override the after_sign_up_path_for method
  def after_sign_up_path_for(resource)
    if resource.receptionist?
      patients_path
    elsif resource.doctor?
      doctor_patients_path # Adjust this to the correct path for doctors
    else
      root_path # Fallback path
    end
  end
end
