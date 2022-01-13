require 'rails_helper'

RSpec.describe "loads/show", type: :view do
  before(:each) do
    @load = assign(:load, Load.create!(
      cover_letter: "Cover Letter",
      title: "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Cover Letter/)
    expect(rendered).to match(/Title/)
  end
end
