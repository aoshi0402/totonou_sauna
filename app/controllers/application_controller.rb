class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_root_path
    when User
      root_path
    end
  end
  
  def after_sign_out_path_for(resource)
    case resource
    when :admin
      new_admin_session_path
    when :public
      root_path
    end
  end
    
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,keys:[
      :name,
      :sex,
      :postcode,
      :prefecture,
      :address_city,
      :address_street,
      :address_building,
      :introduction
      ]
    )
  end
end
