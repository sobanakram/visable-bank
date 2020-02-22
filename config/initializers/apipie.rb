Apipie.configure do |config|
  config.app_name = 'Visable Bankd APIs'
  config.copyright = '&copy; 2020 Soban'
  config.api_base_url = '/api/'
  config.doc_base_url = '/api_docs'
  # where is your API defined?
  config.api_controllers_matcher = File.join(Rails.root, 'app', 'controllers', 'api', '*.rb')

  config.translate = false
  config.validate = false

  config.authenticate = Proc.new do
    authenticate_or_request_with_http_basic do |username, password|
      Rails.env.development? || username == 'developer' && password == 'password'
    end
  end
end
