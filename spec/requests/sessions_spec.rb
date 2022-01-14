require 'rails_helper'

RSpec.describe '/sign_in', type: :request do
  describe 'GET /sign_in' do
    it 'has a 200 status code root' do
      get '/sign_in'
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /logout' do
    it 'has a 3p2 status code root' do
      delete '/logout'
      expect(response.status).to eq(302)
    end
  end
end
