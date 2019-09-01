require 'rails_helper'

RSpec.describe "entries/show", type: :view do
  before(:each) do
    @entry = assign(:entry, Entry.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
