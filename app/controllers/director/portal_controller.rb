class Director::PortalController < ApplicationController
  before_filter :authorize_director
end
