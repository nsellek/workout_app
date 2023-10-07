class TrainerWidget < ApplicationRecord
  belongs_to :trainer
  belongs_to :widget

  default_scope { order(:position) }

  delegate :name,
    :file_name,
    to: :widget
  delegate_missing_to :settings

  def settings
    @settings ||= SettingsHandler.new(super)
  end
end
