namespace :after_party do
  desc 'Deployment task: migrate_workout_max'
  task migrate_workout_max: :environment do
    puts "Running deploy task 'migrate_workout_max'"

    # Put your task implementation HERE.
    WorkoutMax.all.each do |max|
      max.update(workout_id: Exercise.find(max.exercise_id).workout_id)
    end


    # Update task as completed.  If you remove the line below, the task will
    # run with every deploy (or every time you call after_party:run).
    AfterParty::TaskRecord
      .create version: AfterParty::TaskRecorder.new(__FILE__).timestamp
  end
end
