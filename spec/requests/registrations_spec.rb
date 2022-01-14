require 'rails_helper'

RSpec.describe '/sign_up', type: :request do
  describe 'GET /sign_up' do
    it 'has a 200 status code root' do
      get '/sign_up'
      expect(response.status).to eq(200)
    end
  end
end
