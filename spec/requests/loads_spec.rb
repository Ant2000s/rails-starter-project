require 'rails_helper'

RSpec.describe '/loads', type: :request do
  describe 'GET /index' do
    it 'has a 200 status code root' do
      get '/loads'
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /loads/new' do
    it 'has a 200 status code root' do
      get '/loads/new'
      expect(response.status).to eq(200)
    end
  end
  describe '/loads/555' do
    it 'has a 404 status code root' do
      expect { get '/loads/555' }.to raise_error(ActiveRecord::RecordNotFound)
          end
  end
end
