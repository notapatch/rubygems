class ApplicationController < ActionController::Base
  include Pundit
  include PublicActivity::StoreController
  before_action :authenticate_user!

  before_action :set_global_variables, if: :user_signed_in?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def set_global_variables
    @ransack_courses = Course.ransack(params[:courses_search], search_key: :courses_search) #navbar search
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
