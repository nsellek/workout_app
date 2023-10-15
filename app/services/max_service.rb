module MaxService
  CALCULATION = ->(weight, reps) { weight / (1.0278 - (0.0278 * reps)) }

  module_function

  def project_max(weight, reps)
    CALCULATION.call(weight, reps).round(2)
  end
end
