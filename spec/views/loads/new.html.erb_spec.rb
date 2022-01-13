require 'rails_helper'

RSpec.describe "loads/new", type: :view do
  before(:each) do
    assign(:load, Load.new(
      cover_letter: "MyString",
      title: "MyString"
    ))
  end

  it "renders new load form" do
    render

    assert_select "form[action=?][method=?]", loads_path, "post" do

      assert_select "input[name=?]", "load[cover_letter]"

      assert_select "input[name=?]", "load[title]"
    end
  end
end
