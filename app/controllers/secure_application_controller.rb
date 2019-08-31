class SecureApplicationController < ApplicationController
  before_action :authenticate_user!
end
