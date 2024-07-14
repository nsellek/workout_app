class WorkoutDay < ApplicationRecord
  belongs_to :workout_week

  has_one :client, through: :workout_week

  has_many :exercises, dependent: :destroy

  scope :completed, -> { where.not(completed_at: nil) }
  scope :incompleted, -> { where(completed_at: nil) }

  accepts_nested_attributes_for :exercises, allow_destroy: true

  def complete!
    return if completed?

    update(completed_at: Date.today)
  end

  def completed?
    completed_at.present?
  end
end
