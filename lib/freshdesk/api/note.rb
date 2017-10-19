# frozen_string_literal: true

module Freshdesk
  module Api
    class Note < Base
      belongs_to :ticket, class_name: 'Freshdesk::Api::Ticket'

      schema do
        attribute 'id', :integer
        attribute 'body', :string
        attribute 'ticket_id', :integer
      end
    end
  end
end
