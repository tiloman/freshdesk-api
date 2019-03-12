# frozen_string_literal: true

module Freshdesk
  module Api
    class Company < Base
      has_many :contacts, class_name: 'Freshdesk::Api::Contact'
      has_many :tickets, class_name: 'Freshdesk::Api::Ticket'
    end
  end
end
