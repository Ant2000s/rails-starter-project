require 'rails_helper'

RSpec.describe User, type: :model do
  it 'create norm user' do
    user = described_class.create(email: 'norm@email', password: '123')
    expect(user).to be_valid
  end

  it 'create user with error in email' do
    user = described_class.create(email: 'AbnormalEmail', password: '123')
    expect(user).not_to be_valid
  end

  it 'create user with error in password' do
    user = described_class.create(email: 'norm@email', password: '12')
    expect(user).not_to be_valid
  end
end