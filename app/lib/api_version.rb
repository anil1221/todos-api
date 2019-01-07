# frozen_string_literal: true

# For API versions
class ApiVersion
  attr_reader :version, :default

  def initialize(version, default = false)
    @version = version
    @default = default
  end

  # check whether version is mentioned or default
  def matches?(request)
    check_headers(request.headers) || default
  end

  private

  def check_headers(headers)
    # check version from accept headers; expect custom media type 'todos'
    accept = headers[:accept]
    accept && accept.include?("application/vnd.todos.#{version}+json")
  end
end