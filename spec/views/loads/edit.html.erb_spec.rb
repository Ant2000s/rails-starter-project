require 'rails_helper'

RSpec.describe 'loads/edit', type: :view do
  before do
    @load = assign(:load, Load.create!(
                            cover_letter: 'MyString',
                            title: 'MyString'
                          ))
  end

  it 'renders the edit load form' do
    render

    assert_select 'form[action=?][method=?]', load_path(@load), 'post' do
      assert_select 'input[name=?]', 'load[cover_letter]'

      assert_select 'input[name=?]', 'load[title]'
    end
  end
end
