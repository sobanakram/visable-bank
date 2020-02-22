class ApiController < ActionController::API

  rescue_from Exception, with: :render_exception_error

  def render_exception_error(exception)
    raise exception if Rails.env.test?

    render_error(exception.message)
  end

  def render_success(json, status = 200)
    render json: json, status: status
  end

  def render_error(message, status = :unprocessable_entity)
    response = { error: message }
    render json: response, status: status
  end
end