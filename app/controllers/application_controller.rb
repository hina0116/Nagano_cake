class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
    when Customer
      public_items_path
    when Admin
      admin_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :customer
        public_root_path
    elsif resource_or_scope == :admin
        new_admin_session_path
    else
        public_root_path
    end
  end

end
