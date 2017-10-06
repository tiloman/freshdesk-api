# frozen_string_literal: true

module Freshdesk
  module Api
    class Contact < Base
      belongs_to :company, class_name: 'Freshdesk::Api::Company'
    end
  end
end
