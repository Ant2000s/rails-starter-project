require 'rails_helper'

RSpec.describe '/password', type: :request do
  describe 'GET /password' do
    it 'has a 200 status code root' do
      get '/sign_in'
      expect(response.status).to eq(200)
    end
  end
end
