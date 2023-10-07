class HistoryService
  attr_reader :account,
    :exercise,
    :sets

  def initialize(account, exercise_id)
    @account = account
    @exercise = account.exercises.find(exercise_id)
    exercise_ids = account.exercises.where(workout_id: exercise.workout_id).pluck(:id)
    @sets = account
      .workout_sets
      .where(exercise_id: exercise_ids)
  end

  def name
    exercise.workout.name
  end

  def grouped_history
    @grouped_history ||= sets
      .where(warmup: false)
      .reorder(created_at: :desc)
      .each_with_object({}) do |set, hsh|
      date = set.created_at.strftime('%B %d, %Y')
      hsh[date] ||= []
      hsh[date] << "#{set.weight}x#{set.reps}"
    end
  end

end
