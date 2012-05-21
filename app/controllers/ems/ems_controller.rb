module Ems
  class EmsController < ApplicationController
    skip_authorization_check :only => [:index]
        
    def index
      # Workaround for active admin routing problem.
      # see:
      # http://stackoverflow.com/questions/10684566/mountable-engine-routing-with-active-admin-on-rails
      # @todo find a nicer solution for this problem.
      render :layout => 'ems/application'
    end
    
  end
end
