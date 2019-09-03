require 'rails_helper'

RSpec.describe "reminders/new", type: :view do
  before(:each) do
    assign(:reminder, Reminder.new())
  end

  it "renders new reminder form" do
    render

    assert_select "form[action=?][method=?]", reminders_path, "post" do
    end
  end
end
