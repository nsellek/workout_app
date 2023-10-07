class SettingsHandler
  attr_reader :settings

  def initialize(settings = {})
    @settings = settings.with_indifferent_access
  end

  def method_missing(method_name, *_)
    if settings.key? method_name
      settings[method_name]
    else
      ''
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    settings.key?(method_name) || super
  end
end
