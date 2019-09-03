require 'rails_helper'

RSpec.describe "reminders/index", type: :view do
  before(:each) do
    assign(:reminders, [
      Reminder.create!(),
      Reminder.create!()
    ])
  end

  it "renders a list of reminders" do
    render
  end
end
