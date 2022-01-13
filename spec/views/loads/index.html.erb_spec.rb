require 'rails_helper'

RSpec.describe 'loads/index', type: :view do
  before do
    assign(:loads, [
             Load.create!(
               cover_letter: 'Cover Letter',
               title: 'Title'
             ),
             Load.create!(
               cover_letter: 'Cover Letter',
               title: 'Title'
             )
           ])
  end

  it 'renders a list of loads' do
    render
    assert_select 'tr>td', text: 'Cover Letter'.to_s, count: 2
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
  end
end
