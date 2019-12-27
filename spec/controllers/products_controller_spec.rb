require 'rails_helper'

describe ProductsController do
  describe 'GET #index' do
    it "renders the :index template" do
      get :index, params: { id: 1 }
      expect(response).to render_template :index
    end
  end
end 