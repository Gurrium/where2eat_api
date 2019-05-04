class ApplicationController < ActionController::API
  rescue_from Faraday::ResourceNotFound, with: :handle_resource_not_found

  private

  def handle_resource_not_found(exception)
    render json: {
      error_detail: exception.message
    }, status: exception.response[:status]
  end
end
