# frozen_string_literal: true

module Freshdesk
  module Api
    class Configuration
      attr_accessor :api_key, :domain

      def end_point
        "https://#{domain}.freshdesk.com/api/v2/"
      end
    end
  end
end
