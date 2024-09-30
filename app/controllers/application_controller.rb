class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  # def after_sign_in_path_for(resource)
  #   # Specify your custom path here. For example:
  #   patients_path# Or any other path
  # end
end
