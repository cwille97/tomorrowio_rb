require 'configuration.rb'
require 'faraday'
require 'json'

module Tomorrowiorb
    extend Configuration

    class << self
        def forecast(location, timesteps=["1d"], units="metric")
            connection = Faraday.new(
                url: "#{Tomorrowiorb.api_endpoint}/weather/forecast",
                params: {
                    'location': location,
                    'apikey': Tomorrowiorb.api_key
                },
                headers: {'Content-Type' => 'application/json'}
            )
            response = connection.get('') do |req|
                req.options.params_encoder = Faraday::FlatParamsEncoder
                req.params['timesteps'] = timesteps
                req.params['units'] = units
            end

            return TomorrowioResponse.new(response.status,response.headers, response.body)
        end
    end

    class TomorrowioResponse
        def initialize(status, headers, body)
            @status = status
            @headers = headers
            @body = body
        end

        def status
            @status
        end

        def headers
            @headers
        end

        def body
            @body
        end
    end
end