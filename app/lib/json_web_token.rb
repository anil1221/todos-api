# frozen_string_literal:true

# JWT Implementation
class JsonWebToken
  # secret to encode and decode json token
  HMAC_SECRET = Rails.application.credentials.secret_key_base

  def self.encode(payload, exp = 24.hours.from_now)
    # set expiry to 24 hours from created time
    payload[:exp] = exp.to_i

    # sign token with application secret
    JWT.encode(payload, HMAC_SECRET)
  end

  def decode(token)
    # get pay_load; first index in decoded array
    body = JWT.decode(token, HMAC_SECRET)[0]
    HashWithIndifferentAccess.new body

    # rescue from all decode errors
  rescue JWT::DecodeError => e
    # raise custom error to be handled by custom handler
    raise ExceptionHandler::InvalidToken, e.message
  end
end