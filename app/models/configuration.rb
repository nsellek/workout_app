class Configuration < ApplicationRecord
  belongs_to :trainer

  delegate_missing_to :settings

  def settings
    @settings ||= ConfigHandler.new(super)
  end
end
