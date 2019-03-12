# frozen_string_literal: true

module Freshdesk
  module Api
    class Company < Base
      has_many :contacts, class_name: 'Freshdesk::Api::Contact'
    end
  end
end
