require 'rails_helper'

RSpec.describe "journals/new", type: :view do
  before(:each) do
    assign(:journal, Journal.new())
  end

  it "renders new journal form" do
    render

    assert_select "form[action=?][method=?]", journals_path, "post" do
    end
  end
end
