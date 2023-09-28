import { defaultInit } from "utils";
import { NewWorkout } from 'trainers/new_workout'

const EditWorkout = class extends NewWorkout {
  constructor() {
    super()
  }

  deleteExercise(btn) {
    let exercise = btn.closest('.exercise'),
        dayContainer = btn.closest('.day');

    if (exercise.querySelector('.exercise-id'))
      this.addHidden(exercise)
    else
      exercise.remove()

    this.updateExercises(dayContainer);
  }

  deleteDay(btn) {
    let day = btn.closest('.day');

    if (day.querySelector('.workout-day-id'))
      this.addHidden(day)
    else
      day.remove()

    this.updateDays();
  }

  addHidden(container) {
    let input = document.createElement('input'),
        idField = container.querySelector('input');
    container.classList.add('d-none');

    input.setAttribute('type', 'hidden');
    input.setAttribute('name', idField.getAttribute('name').replace('id', '_destroy'));
    input.setAttribute('value', 1);

    container.append(input)
  }
}

defaultInit('.edit_workout_week', EditWorkout)
