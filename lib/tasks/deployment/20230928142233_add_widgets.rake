namespace :after_party do
  desc 'Deployment task: add_widgets'
  task add_widgets: :environment do
    puts "Running deploy task 'add_widgets'"

    # Put your task implementation HERE.
    widgets = [
      {
        name: 'Maxes',
        file_name: 'maxes',
        description: 'Track selected exercises current max',
        settings: {
          width: 'col-3'
        }
      },
      {
        name: 'Maxes Over Time',
        file_name: 'maxes_over_time',
        description: 'how history of selected exercises maxes over specific timeframe',
        settings: {
          width: 'col-6'
        }
      }
    ]

    Widget.upsert_all(widgets)

    # Update task as completed.  If you remove the line below, the task will
    # run with every deploy (or every time you call after_party:run).
    AfterParty::TaskRecord
      .create version: AfterParty::TaskRecorder.new(__FILE__).timestamp
  end
end
