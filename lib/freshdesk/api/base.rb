# frozen_string_literal: true

module Freshdesk
  module Api
    class Base < ActiveResource::Base
      class << self
        def configure!
          self.site     = Freshdesk::Api.config.end_point
          self.user     = Freshdesk::Api.config.api_key
          self.password = 'X'
        end
      end

      def as_json(opts = {})
        super({ except: %i[id facebook_id created_at updated_at] }.merge(opts))
      end
    end
  end
end
