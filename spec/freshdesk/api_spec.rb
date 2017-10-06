# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Freshdesk::Api do
  it 'has a version number' do
    expect(Freshdesk::Api::VERSION).not_to be nil
  end

  describe 'configuration' do
    before do
      Freshdesk::Api.configure do |config|
        config.api_key = 'something'
        config.domain = 'mydomain'
      end
    end

    it 'correctly sets config options' do
      expect(Freshdesk::Api.config.api_key).to eq('something')
      expect(Freshdesk::Api.config.domain).to eq('mydomain')
    end

    it 'responds with correct endpoint' do
      expect(Freshdesk::Api.config.end_point).to \
        eq('https://mydomain.freshdesk.com/api/v2/')
    end
  end
end
