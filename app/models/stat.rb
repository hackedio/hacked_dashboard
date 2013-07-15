class Stat < ActiveRecord::Base
  before_save :can_only_display_5_stats

  private

  def can_only_display_5_stats
    displayed = Stat.where(display:true).to_a
    displayed.delete(self) if self.display == true
    if self.display == true && displayed.count >= 5
      errors.add(:display, "can only display 5 stats at a time. Set one to false before setting another to true")
      self.display = false
    end
  end

end
