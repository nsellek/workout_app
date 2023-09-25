class ExercisePresenter < BasePresenter

  def sets_reps(settings)
    case settings.sets_reps
    when 'short'
      short_sets_reps
    when 'long'
      long_sets_reps
    end
  end

  def name
    workout&.name || object.name || user_choice_workout
  end

  private

  def short_sets_reps
    return if sets.blank? && reps.blank?
    return "#{sets} sets" if reps.blank?

    "(#{sets} x #{reps}#{" @ #{weight}lbs" if weight.present?})"
  end

  def long_sets_reps
    return if sets.blank? && reps.blank?
    return "#{sets} sets" if reps.blank?

    "(#{sets} sets of #{reps}#{" @ #{weight}lbs" if weight.present?})"
  end

  def user_choice_workout
    "#{muscle_group.name} of choice"
  end
end
