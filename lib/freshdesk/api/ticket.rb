# frozen_string_literal: true

module Freshdesk
  module Api
    class Ticket < Base
      belongs_to :company, class_name: 'Freshdesk::Api::Company'
      has_many :conversations, class_name: 'Freshdesk::Api::Conversation'

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
