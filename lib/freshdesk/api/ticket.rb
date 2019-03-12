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
    end
  end
end
