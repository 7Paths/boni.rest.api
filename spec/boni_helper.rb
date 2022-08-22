
require "rails_helper"
require "spec_helper"
require "faker"


RSpec.shared_context "request user authentication" do
    before(:each) do
        @user = User.first
        sign_in(@user)
    end
end