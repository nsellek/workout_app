class WorkoutDayPresenter < BasePresenter

  def exercises
    @exercises ||= ExercisePresenter.from_collection(object.exercises)
  end
end
