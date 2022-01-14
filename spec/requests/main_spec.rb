require 'rails_helper'

RSpec.describe '/', type: :request do
  describe 'GET /index' do
    it 'has a 200 status code root' do
      get '/'
      expect(response.status).to eq(200)
    end
  end
end
