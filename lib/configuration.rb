module Tomorrowiorb
    module Configuration
        DEFAULT_API_ENDPOINT = 'https://api.tomorrow.io/v4'

        attr_writer :api_endpoint
        attr_writer :api_key

        # Yield self to be able to configure Tomorrowiorb with block-style configuration.
        #
        # Example:
        #
        #   Tomorrowiorb.configure do |configuration|
        #     configuration.api_key = 'this-is-your-api-key'
        #   end
        def configure
            yield self
        end

        def api_endpoint
            @api_endpoint ||= DEFAULT_API_ENDPOINT
        end

        def api_key
            @api_key
        end
    end
end
