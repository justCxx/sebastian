require 'rails_helper'

describe Web::UsersController, type: :controller do
  describe 'GET new' do
    it 'has a 200 status' do
      get :new
      expect(response.status).to eq 200
    end
  end
end
