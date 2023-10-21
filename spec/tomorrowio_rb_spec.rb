require_relative '../lib/configuration.rb'
require_relative '../lib/tomorrowio_rb.rb'
require 'faraday'
require 'rspec'

describe Tomorrowiorb do
  describe '.forecast' do

    before do
      Tomorrowiorb.api_key = ''
    end

    it 'returns a valid forecast' do
      location = 'New York'

      # Mock the Faraday connection and response
      connection = double('Faraday::Connection')
      response = double('Faraday::Response', status: 200, headers: {}, body: {})
      allow(Faraday).to receive(:new).and_return(connection)
      allow(connection).to receive(:get).and_return(response)

      result = Tomorrowiorb.forecast(location)

      expect(result.status).to eq(200)
      expect(result.headers).to eq({})
      expect(result.body).to eq({})
    end

    it 'returns an error status when the response is not successful' do
      location = 'Invalid Location'

      # Mock the Faraday connection and response to simulate an error
      connection = double('Faraday::Connection')
      response = double('Faraday::Response', status: 404, headers: {}, body: {})
      allow(Faraday).to receive(:new).and_return(connection)
      allow(connection).to receive(:get).and_return(response)

      result = Tomorrowiorb.forecast(location)

      expect(result.status).to eq(404)
      expect(result.headers).to eq({})
      expect(result.body).to eq({})
    end
  end
end
