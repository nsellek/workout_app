class Trainer < Account
  has_many :trainer_clients, dependent: :destroy
  has_many :workout_weeks
  has_many :workout_days, through: :workout_weeks
  has_many :workouts

  has_one :invite_token
  has_one :configuration

  def clients
    @clients ||= Client.where(id: trainer_clients.active.pluck(:client_id))
  end

  def token
    (invite_token || create_invite_token).token
  end

  def settings
    return @settings if defined? @settings

    config = configuration || create_configuration
    @settings = config.settings
  end
end
