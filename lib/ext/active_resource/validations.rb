# frozen_string_literal: true

module ActiveResource
  module Validations
  end

  class ResourceInvalid < ClientError #:nodoc:
  end

  class Errors < ActiveModel::Errors
    # rubocop:disable Metrics/AbcSize
    def from_array(messages, save_cache = false)
      clear unless save_cache
      messages.each do |message|
        attr_message = @base.known_attributes.sort_by { |a| -a.length }.detect do |attr_name|
          if message['field'] == attr_name.to_s
            add attr_name, message['message']
          end
        end
        self[:base] << "#{message['field'].humanize}: #{message['message']}" if attr_message.nil?
      end
    end
    # rubocop:enable Metrics/AbcSize
  end
end
