class DashboardsController < ApplicationController
  def show
    @journals = Journal.accessible_by(current_ability, :manage)
  end
end
