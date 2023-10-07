class Widget < ApplicationRecord

  delegate_missing_to :settings

  def settings
    @settings ||= SettingsHandler.new(super)
  end
end
