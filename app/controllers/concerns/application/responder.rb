
module Application
    module Responder
        include ActiveSupport::Concern
        
        def respond_with_successful data
            payload = {
                successful: true,
                payload: data
            }

            respond_with_http 200, payload
        end

        def respond_with_error error
            payload = {
                successful: false,
                error: error
            }

            respond_with_http 500, payload
        end

        def respond_with_not_found error
            payload = {
                successful: false,
                error: error
            }

            respond_with_http 404, payload
        end

        def respond_with_http status, payload
            render status: status, json: payload
        end
    end
end

