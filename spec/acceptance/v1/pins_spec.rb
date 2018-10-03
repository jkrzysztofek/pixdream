require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Pin' do
  let!(:pin) { create(:pin) }
  let!(:pin_id) { pin.id }

  header 'Accept', 'application/vnd.api+json'
  header 'Content-Type', 'application/vnd.api+json'

  get '/api/v1/pins?include=images' do
    before do
      create(:pin)
    end

    example 'Index' do
      do_request
      
      expect(status).to eq 200
    end
  end

  get '/api/v1/pins/:pin_id' do
    example 'Show' do
      do_request

      expect(status).to eq 204
    end
  end
end
