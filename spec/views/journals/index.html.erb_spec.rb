require 'rails_helper'

RSpec.describe "journals/index", type: :view do
  before(:each) do
    assign(:journals, [
      Journal.create!(),
      Journal.create!()
    ])
  end

  it "renders a list of journals" do
    render
  end
end
