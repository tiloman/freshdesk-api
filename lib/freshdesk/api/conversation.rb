# frozen_string_literal: true

module Freshdesk
  module Api
    class Conversation < Base
      self.prefix = '/api/v2/tickets/:ticket_id/'
      belongs_to :ticket, class_name: 'Freshdesk::Api::Ticket'

      class << self
        def create(*args)
          self.collection_name = 'notes'
          super
        end
      end
    end
  end
end
