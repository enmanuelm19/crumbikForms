class CallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2

    #@user = User.find_for_google_oauth2(request.env[“omniauth.auth”], current_user)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?

      #session[:sn_user] = request.env[‘omniauth.params’]
      set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
    #  flash[:notice] = I18n.t “devise.omniauth_callbacks.success”, :kind => “Google”

      sign_in_and_redirect @user, :event => :authentication

    else

      #session[“devise.google_data”] = request.env[“omniauth.auth”]

      redirect_to new_user_registration_url

    end

  end




end
