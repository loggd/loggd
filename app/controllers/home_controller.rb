class HomeController < ApplicationController
  def show
    @journals = Journal.public_books.accessible_by(current_ability, :read).limit(12).decorate
  end
end
