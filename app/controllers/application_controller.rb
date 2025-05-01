class ApplicationController < ActionController::API
    before_action :authenticate_api_key!

    private
    def authenticate_api_key!
        # Try to get API key from header or query param
        token = request.headers['X-API-KEY'] || params[:api_key]
    
        unless ActiveSupport::SecurityUtils.secure_compare(token.to_s, Rails.application.credentials.api_key.to_s)
          render json: { error: 'Unauthorized' }, status: :unauthorized
        end
    end

end

# the parent controller