# frozen_string_literal: true

require 'activeresource'
require 'ext/active_resource/connection'
require 'ext/active_resource/validations'

module Freshdesk
  module Api
    class << self
      attr_writer :configuration

      def configuration
        @configuration ||= Configuration.new
      end
      alias config configuration

      def reset
        @configuration = Configuration.new
      end

      def configure
        yield(configuration)
        Freshdesk::Api::Base.configure!
      end
    end
  end
end

require 'freshdesk/api/version'
require 'freshdesk/api/configuration'
require 'freshdesk/api/base'
require 'freshdesk/api/company'
require 'freshdesk/api/contact'
require 'freshdesk/api/ticket'
require 'freshdesk/api/note'
