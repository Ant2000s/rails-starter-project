require 'rails_helper'

RSpec.describe '/password', type: :request do
  before do
    User.create(email: 'test@test', password: '123')
  end

  describe 'GET /password' do
    it 'has a 200 status code password' do
      post '/sign_in', params: { email: 'test@test', password: '123' }
      get '/password'
      expect(response.status).to eq(200)
    end
  end
end
