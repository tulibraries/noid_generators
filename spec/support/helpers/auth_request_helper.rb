# frozen_string_literal: true

module AuthHelper
  def http_login
    user = "admin"
    pw = "random"
    request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials(user, pw)
  end
end

module AuthRequestHelper
  #
  # pass the @env along with your request, eg:
  #
  # GET '/labels', {}, @env
  #
  def http_login
    @env ||= {}
    user = "admin"
    pw = "random"
    @env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials(user, pw)
  end
end
