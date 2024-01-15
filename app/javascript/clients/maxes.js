import {defaultInit, defaultAutocompleteOptions} from "utils";

export const Maxes = class {
  constructor() {
    this.autoCompleteOptions = {...defaultAutocompleteOptions,
      appendTo: '.workout_max_form',
      source: function(request, response) {
        $.getJSON(
          '/workouts',
          {
            term: request.term
          },
          data => response(data)
        )
      },
      select: (e, ui) => {
        e.preventDefault()

        let $this = $(e.target),
          workout = ui.item

        $this.val(workout.label)
        $this.parents('form').find('.workout_id').val(workout.value)
      }
    }
  }

  bindWorkoutSearch() {
    $('.autocomplete').autocomplete(this.autoCompleteOptions)
  }

  init() {
    this.bindWorkoutSearch();
  }
}

defaultInit('#maxes', Maxes)