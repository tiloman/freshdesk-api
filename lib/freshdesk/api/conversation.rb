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

      schema do
        attribute 'id', :integer
        attribute 'body', :string
        attribute 'body_text', :string
        attribute 'incoming', :boolean
        attribute 'private', :boolean
        attribute 'ticket_id', :integer
        attribute 'user_id', :integer
        attribute 'created_at', :datetime
        attribute 'updated_at', :datetime
      end
    end
  end
end
