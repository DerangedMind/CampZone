class Counselor::PortalController < ApplicationController
  before_filter :authorize_counselor

end
