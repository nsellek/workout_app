class Client < Account
  has_many :trainer_clients, dependent: :destroy
  has_many :workout_weeks
  has_many :workout_days, through: :workout_weeks
  has_many :exercises, through: :workout_days
  has_many :workout_sets, through: :exercises
  has_many :workout_maxes

  def trainer
    @trainer ||= trainer_clients.active.first&.trainer
  end

  def trainer=(obj)
    trainer_clients.new(trainer_id: obj.id, active: true).save!
  end

  def configuration
    @configuration ||= trainer&.configuration
  end

  def past_trainers
    @past_trainers ||= Trainer.where(id: trainer_clients.not_active.pluck(:trainer_id))
  end

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
