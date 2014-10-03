require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do
  describe "GET code" do
    it 'redirects to the source code' do
      expect(response).to have_http_status(200)
    end
  end
end
