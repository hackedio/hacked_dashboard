class UpdateStatsController < ApplicationController
  layout 'update_stats'
  
  def index
    @stats = Stat.all
  end
end
