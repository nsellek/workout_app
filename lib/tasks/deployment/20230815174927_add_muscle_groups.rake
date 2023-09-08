namespace :after_party do
  desc 'Deployment task: add_muscle_groups'
  task add_muscle_groups: :environment do
    puts "Running deploy task 'add_muscle_groups'"

    # Put your task implementation HERE.
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

    # Update task as completed.  If you remove the line below, the task will
    # run with every deploy (or every time you call after_party:run).
    AfterParty::TaskRecord
      .create version: AfterParty::TaskRecorder.new(__FILE__).timestamp
  end
end
