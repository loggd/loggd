require 'rails_helper'

RSpec.describe "journals/edit", type: :view do
  before(:each) do
    @journal = assign(:journal, Journal.create!())
  end

  it "renders the edit journal form" do
    render

    assert_select "form[action=?][method=?]", journal_path(@journal), "post" do
    end
  end
end
