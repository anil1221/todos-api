# frozen_string_literal:true

# To check authorization of all the requests
class AuthorizeApiRequest
  def initialize(headers = {})
    @headers = headers
  end

  # Service entry point - returns valid user object
  def call
    { user: user }
  end

  private

  def user
    # check if the user is in the database
    # memorize user object
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    # handle user not found
  rescue ActiveRecord::RecordNotFound => e
    # raise custom error
    raise( ExceptionHandler::InvalidToken,
        ( "#{Message.invalid_token} #{e.message}") )
  end

  # Decode authentication token
  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  # Check for 'Authorization' header
  def http_auth_header
    if @headers['Authorization'].present?
      return @headers['Authorization'].split(' ').last
    end
    raise(ExceptionHandler::MissingToken, Message.missing_token)
  end
end