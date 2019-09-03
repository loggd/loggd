require 'rails_helper'

RSpec.describe "reminders/show", type: :view do
  before(:each) do
    @reminder = assign(:reminder, Reminder.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
