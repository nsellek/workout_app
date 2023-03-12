class WorkoutWeekPresenter < BasePresenter

  def title(count)
    object.name || "Week #{count}"
  end

  def day_count
    workout_days.count
  end

  def exercise_count
    exercises.count
  end
end
