require 'rails_helper'

RSpec.describe Load, type: :model do
  it 'create norm load' do
    load = described_class.create(title: 'ruby.rb', user_id: 123)
    expect(load).to be_valid
  end

  it 'the same user already has such a file in the database' do
    described_class.create(title: 'ruby.rb', user_id: 123)
    load = described_class.create(title: 'ruby.rb', user_id: 123)
    expect(load).not_to be_valid
  end
end
