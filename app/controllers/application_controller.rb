class ApplicationController < ActionController::API

  rescue_from CanCan::AccessDenied do |exception|
    render json: { message: exception.message }, status: :forbidden
  end
end
