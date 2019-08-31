class DashboardsController < SecureApplicationController
  def show
    @journals = Journal.accessible_by(current_ability, :manage).decorate
  end
end
