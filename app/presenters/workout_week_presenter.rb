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

  def days
    workout_days
  end

  def workout_days(use_super = false)
    return super() if use_super

    @workout_days ||= WorkoutDayPresenter.from_collection(object.workout_days)
  end
end
