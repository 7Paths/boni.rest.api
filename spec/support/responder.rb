module Support
    @@response_json = nil

    def response_json
        @@response_json = JSON.parse(response.body) if response.body
    end

    def expected_response_with_successful
        @@response_json = nil
        expect(response).to have_http_status(:success)
        expect(response.content_type).to eq("application/json")
        response_json()
    end

    def expected_response_with_error
        @@response_json = nil
        expect(response).to have_http_status(:bad_request)
        expect(response.content_type).to eq("application/json")
        expect(response_json).to be_an_instance_of(Hash)
        expect(response_json).to have_key('message') 
        expect(response_json).to have_key('details') 
        response_json()
    end

    def expected_response_with_not_found
        @@response_json = nil
        expect(response).to have_http_status(:not_found)
        expect(response.content_type).to eq("application/json")
        response_json()
    end

    def expected_response_with_unauthorized
        @@response_json = nil
        expect(response).to have_http_status(:unathorized)
        expect(response.content_type).to eq("application/json")
        response_json()
    end

    def expected_response_with_pagination
        # Still in process
        response_json()
    end
end