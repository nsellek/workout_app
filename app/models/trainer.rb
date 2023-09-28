class Trainer < Account
  has_many :trainer_clients, dependent: :destroy
  has_many :clients, through: :trainer_clients
  has_many :workout_weeks
  has_many :workout_days, through: :workout_weeks
  has_many :workouts
  has_many :trainer_widgets
  has_many :widgets, through: :trainer_widgets

  has_one :invite_token
  has_one :configuration

  def token
    (invite_token || create_invite_token).token
  end

  def settings
    return @settings if defined? @settings

    config = configuration || create_configuration
    @settings = config.settings
  end
end
