class WorkoutMax < ApplicationRecord
  belongs_to :workout
  belongs_to :client

  def set_history
    return unless amount_changed?

    # If you set a "new" max multiple times in the same day just replace them
    history.delete_if { |h| h['date'] == Date.today.to_s }
    history.prepend({ amount:, date: Date.today })
  end
end
