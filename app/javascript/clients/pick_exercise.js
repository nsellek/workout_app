import { defaultInit } from 'utils';

export const PickExercise = class {
  constructor() {
    this.modal;
    this.autocompleteOptions = {
      appendTo: '.exercise-form',
      source: function(request, response) {
        $.getJSON(
          '/workouts',
          {
            term: request.term,
            muscle_group_id: this.element.data('muscleGroupId')
          },
          data => response(data)
        )
      },
      minLength: 3,
      classes: {
        "ui-autocomplete": "dropdown-menu autocomplete-dropdown",
        "ui-menu-item-wrapper": "dropdown-item",
        "ui-menu-item": ""
      },
      change: (e, ui) => {
        if (ui.item === null)
          e.target.value = ""
      },
      select: (e, ui) => {
        e.preventDefault();
        let $this = $(e.target),
          workout = ui.item

        $this.val(workout.label)
        $this.parents('form').find('.workout_id').val(workout.value)
      }
    }
  }

  bindModalOpen() {
    document.addEventListener('turbo:frame-render', event => {
      let target = event.target;

      if (target.id === 'modal') {
        this.modal = new bootstrap.Modal(target.querySelector('#exercise-modal'));
        this.bindWorkoutSearch();
        this.modal.show();
      }
    })
  }

  bindModalClose() {
    document.addEventListener('turbo:submit-end', event => {
      let target = event.target;

      if (target.classList.contains('exercise-form'))
        this.modal.hide()
    });
  }

  bindWorkoutSearch() {
    $('.autocomplete').autocomplete(this.autocompleteOptions)
  }

  init() {
    this.bindModalOpen();
    this.bindModalClose();
  }
}

defaultInit('#workouts', PickExercise)
