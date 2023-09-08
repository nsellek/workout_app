namespace :after_party do
  desc 'Deployment task: add_exercises'
  task add_exercises: :environment do
    puts "Running deploy task 'add_exercises'"

    # Put your task implementation HERE.
    # source: https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/dist/exercises.json
    workouts = YAML.load_file("#{Rails.root}/lib/assets/workouts.yaml")
    workouts.map! do |workout|
      workout['muscle_group_id'] = MuscleGroup.hashed_all[workout['muscle_group_id']].id
      workout
    end

    Workout.upsert_all(workouts)

    # Update task as completed.  If you remove the line below, the task will
    # run with every deploy (or every time you call after_party:run).
    AfterParty::TaskRecord
      .create version: AfterParty::TaskRecorder.new(__FILE__).timestamp
  end
end
