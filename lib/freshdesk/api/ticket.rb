# frozen_string_literal: true

module Freshdesk
  module Api
    class Ticket < Base
      belongs_to :company, class_name: 'Freshdesk::Api::Company'
      has_many :conversations, class_name: 'Freshdesk::Api::Conversation'

      def create_reply(opts)
        opts = opts.merge(ticket_id: id, private: false)
        Conversation.create(opts)
      end

      def create_note(opts)
        opts = opts.merge(ticket_id: id, private: true)
        Conversation.create(opts)
      end

      schema do
        attribute 'id', :integer
        attribute 'description', :string
        attribute 'status', :integer
        attribute 'subject', :string
        attribute 'priority', :integer
        attribute 'requester_id', :integer
        attribute 'phone', :string
        attribute 'email', :string
        attribute 'type', :string
      end
    end
  end
end
