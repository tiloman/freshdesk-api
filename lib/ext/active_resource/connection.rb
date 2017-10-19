# frozen_string_literal: true

require 'active_support/core_ext/benchmark'
require 'active_support/core_ext/uri'
require 'active_support/core_ext/object/inclusion'
require 'net/https'
require 'date'
require 'time'
require 'uri'

module ActiveResource
  class Connection
    private

    # Handles response and error codes from the remote service.
    def handle_response(response)
      case response.code.to_i
        when 301, 302, 303, 307
          raise(Redirection.new(response))
        when 200...400
          response
        when 400
          raise(ResourceInvalid.new(response))
        when 401
          raise(UnauthorizedAccess.new(response))
        when 403
          raise(ForbiddenAccess.new(response))
        when 404
          raise(ResourceNotFound.new(response))
        when 405
          raise(MethodNotAllowed.new(response))
        when 409
          raise(ResourceConflict.new(response))
        when 410
          raise(ResourceGone.new(response))
        when 422
          raise(ResourceInvalid.new(response))
        when 401...500
          raise(ClientError.new(response))
        when 500...600
          raise(ServerError.new(response))
        else
          raise(ConnectionError.new(response, "Unknown response code: #{response.code}"))
      end
    end
  end
end
