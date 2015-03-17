class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
 
  def self.provides_callback_for(*providers)
    providers.each do |provider|
      class_eval %Q{
        def #{provider}
          if !current_user.blank?

            binding = User.find_binding(env["omniauth.auth"])

            if binding.present?
              if binding.user != current_user
                flash[:error] = "This binding is already belongs to others, if you still have problem, please file a bug to logdown@rocodev.com"
              else
                flash[:warning] = "You already bind this 3rd party account"
              end
            else
              current_user.bind_service(env["omniauth.auth"])
              flash[:notice] = "Bind #{provider} account successfully."
            end

            redirect_to account_root_path
          else

            if !env["omniauth.auth"].info["email"].include?("spoonrocket.com")              
              flash[:danger] = "You must be SpoonRocket employee, Please use your company account to login!"
              redirect_to root_path
              return
            end

            @user = User.find_or_create_for_#{provider}(env["omniauth.auth"])
  
            if @user.persisted?
             # flash[:notice] = "Signed in with #{provider.to_s.titleize} successfully."            
              sign_in_and_redirect @user, :event => :authentication, :notice => "Signed in successfully."
            else
              session[:auth_data] = env["omniauth.auth"]
              render "#{provider.to_s.underscore}"
            end
          end
        end
      }
    end
  end

  provides_callback_for :google_oauth2

  # This is solution for existing accout want bind Google login but current_user is always nil
  # https://github.com/intridea/omniauth/issues/185
  def handle_unverified_request
    true
  end

end