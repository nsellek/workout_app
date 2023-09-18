# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

muscle_groups = [
  { name: 'Abdominals' },
  { name: 'Hamstrings' },
  { name: 'Adductors' },
  { name: 'Quadriceps' },
  { name: 'Biceps' },
  { name: 'Shoulders' },
  { name: 'Chest' },
  { name: 'Middle Back' },
  { name: 'Calves' },
  { name: 'Glutes' },
  { name: 'Lower Back' },
  { name: 'Lats' },
  { name: 'Triceps' },
  { name: 'Traps' },
  { name: 'Forearms' },
  { name: 'Neck' },
  { name: 'Abductors' }
]

MuscleGroup.upsert_all(muscle_groups)

workouts = YAML.load_file("#{Rails.root}/lib/assets/workouts.yaml")
workouts.map! do |workout|
  workout['muscle_group_id'] = MuscleGroup.hashed_all[workout['muscle_group_id']].id
  workout
end

Workout.upsert_all(workouts)
