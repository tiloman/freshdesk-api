# frozen_string_literal: true

module Freshdesk
  module Api
    class Ticket < Base
      belongs_to :company, class_name: 'Freshdesk::Api::Company'
    end
  end
end
