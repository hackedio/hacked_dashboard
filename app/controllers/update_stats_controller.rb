class UpdateStatsController < ApplicationController
  layout 'plain'
  
  def index
    @stats = Stat.all
  end
end
