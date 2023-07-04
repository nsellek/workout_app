class ExercisePresenter < BasePresenter

  def sets_reps
    "(#{sets} x #{reps}#{" @ #{weight}lbs" if weight.present?})"
  end
end
