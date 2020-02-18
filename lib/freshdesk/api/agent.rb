# frozen_string_literal: true

module Freshdesk
  module Api
    class Agent < Base
      belongs_to :contact, class_name: 'Freshdesk::Api::Contact'
    end
  end
end
