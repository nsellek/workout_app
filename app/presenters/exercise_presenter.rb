class ExercisePresenter < BasePresenter

  def sets_reps(settings)
    case settings.sets_reps
    when 'short'
      "(#{sets} x #{reps}#{" @ #{weight}lbs" if weight.present?})"
    when 'long'
      "(#{sets} sets of #{reps}#{" @ #{weight}lbs" if weight.present?})"
    end
  end
end
