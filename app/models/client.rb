class Client < Account
  has_one :trainer_client, dependent: :destroy
  has_one :trainer, through: :trainer_client
  has_one :configuration, through: :trainer

  has_many :workout_weeks
  has_many :workout_days, through: :workout_weeks
  has_many :exercises, through: :workout_days
  has_many :workout_sets, through: :exercises
  has_many :workout_maxes

  def current_workout_day
    @current_workout_day ||= workout_days
      .includes(exercises: :workout_sets)
      .where(
        completed_at: [Date.today, nil],
        workout_weeks: {
          deleted: false
        }
      )
      .first
  end

  def settings
    @settings ||= configuration&.settings || ConfigHandler.new
  end
end
