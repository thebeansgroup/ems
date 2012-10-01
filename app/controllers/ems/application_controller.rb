module Ems
  class ApplicationController < ActionController::Base
    # Make sure we only have authenticated users beyond this point
    before_filter :authenticate_user!
    # Also make sure we either have to check cancan or skipit, emtpy is too risky
    check_authorization

    # # Global cancan failure recovery
    rescue_from CanCan::AccessDenied do |exception|
      redirect_to main_app.new_user_session_path, :alert => exception.message
    end

    # We need to make sure that we are using the ems abilities in the EMS
    def current_ability
      @current_ability ||= Ability.new(current_user)
    end
  end
end
