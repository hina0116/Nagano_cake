class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
    when Customer
      public_root_path
    when Admin
      admin_path
    end
  end

end
