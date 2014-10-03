RSpec.describe WelcomeController, :type => :controller do
  describe "GET code" do
    it 'redirects to the source code' do
      get :code
      expect(response).to have_http_status(302)
    end
  end
end
