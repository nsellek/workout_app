class ConfigHandler
  CONFIG_FIELDS = [
    :nav_color,
    :nav_text_color,
    :side_nav_color,
    :side_nav_text_color,
    :sets_reps,
    :app_name
  ].freeze
  CONFIG_DEFAULTS = {
    sets_reps: 'short',
    app_name: 'Workout App',
    nav_color: '#212529',
    side_nav_color: '#6c757d',
    nav_text_color: '#ffffff',
    side_nav_text_color: '#ffffff'
  }.freeze
  BACKGROUND_SETTINGS = [:nav_color, :side_nav_color].freeze
  TEXT_SETTINGS = [:nav_text_color, :side_nav_text_color].freeze

  attr_reader :config

  def initialize(config = {})
    @config = config.with_indifferent_access
  end

  CONFIG_FIELDS.each do |field|
    define_method field do
      config[field] || CONFIG_DEFAULTS[field]
    end

    define_method "#{field}=" do |value|
      config[field] = value.presence
    end
  end
end
