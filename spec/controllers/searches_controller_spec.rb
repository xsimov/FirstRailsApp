require 'rails_helper'

RSpec.describe SearchesController, :type => :controller do
  context 'create method' do
    it "renders locations index" do
      local_search = Search.new
      local_search.query = "Home"
      post :create, { search: local_search }
      expect(response).to render_template('/locations/index')
    end
  end
end
