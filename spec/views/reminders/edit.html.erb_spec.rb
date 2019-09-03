require 'rails_helper'

RSpec.describe "reminders/edit", type: :view do
  before(:each) do
    @reminder = assign(:reminder, Reminder.create!())
  end

  it "renders the edit reminder form" do
    render

    assert_select "form[action=?][method=?]", reminder_path(@reminder), "post" do
    end
  end
end
