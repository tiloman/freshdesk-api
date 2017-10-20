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
    # rubocop:disable all
    def handle_response(response)
      case response.code.to_i
      when 301, 302, 303, 307
        raise Redirection, response
      when 200...400
        response
      when 400
        raise ResourceInvalid, response
      when 401
        raise UnauthorizedAccess, response
      when 403
        raise ForbiddenAccess, response
      when 404
        raise ResourceNotFound, response
      when 405
        raise MethodNotAllowed, response
      when 409
        raise ResourceConflict, response
      when 410
        raise ResourceGone, response
      when 422
        raise ResourceInvalid, response
      when 401...500
        raise ClientError, response
      when 500...600
        raise ServerError, response
      else
        raise(ConnectionError.new(response, "Unknown response code: #{response.code}"))
      end
    end
  end
end
