import { defaultInit, stopDefault, addEventListener } from "utils";

export const NewWorkout = class {
  constructor() {
    this.addExerciseBtns = document.querySelectorAll('.add-exercise');
    this.exerciseTemplate = document.querySelector('#exercise-template');
    this.addDayBtn = document.querySelector('.add-day');
    this.dayTemplate = document.querySelector('#day-template');
    this.daysContainer = document.querySelector('.days');
    this.deleteExerciseBtns = document.querySelectorAll('.remove-workout');
    this.deleteDayBtns = document.querySelectorAll('.remove-day');
    this.clientChoiceBtns = document.querySelectorAll('.client-choice-toggle');
    this.autocompleteOptions = {
      source: '/workouts',
      minLenght: 3,
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
        $this.closest('.exercise').find('.workout_id').val(workout.value)
      }
    }
  }

  bindAddExerciseBtns() {
    addEventListener(this.addExerciseBtns, 'click', event => {
      stopDefault(event);
      let exercisesContainer = event.target.previousElementSibling
      this.addExercise(event.target, exercisesContainer);
    })
  }

  bindAddDayBtn() {
    this.addDayBtn.addEventListener('click', event => {
      stopDefault(event);
      this.addDay();
    })
  }

  bindDeleteExerciseBtns() {
    addEventListener(this.deleteExerciseBtns, 'click', event => {
      stopDefault(event)
      this.deleteExercise(event.target)
    })
  }

  bindDeleteDayBtns() {
    addEventListener(this.deleteDayBtns, 'click', event => {
      stopDefault(event)
      this.deleteDay(event.target)
    })
  }

  bindWorkoutSearch() {
    $('.autocomplete').autocomplete(this.autocompleteOptions)
  }

  bindClientChoiceBtn() {
    addEventListener(this.clientChoiceBtns, 'click', event => {
      this.toggleClientChoice(event.target);
    })
  }

  addExercise(addBtn, exercisesContainer) {
    let exerciseNode = this.exerciseTemplate.content.cloneNode(true),
        inputFields = exerciseNode.querySelectorAll('input'),
        labelFields = exerciseNode.querySelectorAll('label'),
        $autoComplete = $(exerciseNode.querySelector('.autocomplete')),
        exerciseCount = exercisesContainer.querySelectorAll('.exercise').length,
        dayCount = addBtn.closest('.day').dataset.count;

    exerciseNode.querySelector('.workout_count').innerText = (exerciseCount + 1);
    inputFields.forEach(field => {
      let name = field.getAttribute('name'),
          id = field.id;

      name = name.replace('{exercise}', exerciseCount).replace('{day}', dayCount);
      field.setAttribute('name', name);

      id = id.replace('{exercise}', exerciseCount).replace('{day}', dayCount)
      field.id = id;
    })
    labelFields.forEach(field => {
      let forAttr = field.getAttribute('for');

      forAttr = forAttr.replace('{exercise}', exerciseCount).replace('{day}', dayCount)
      field.setAttribute('for', forAttr);
    })
    exerciseNode.querySelector('.remove-workout').addEventListener('click', event => {
      stopDefault(event)
      this.deleteExercise(event.target)
    })
    exerciseNode.querySelector('.client-choice-toggle').addEventListener('click', event => {
      this.toggleClientChoice(event.target);
    })
    exercisesContainer.append(exerciseNode);
    $autoComplete.autocomplete(this.autocompleteOptions);
  }

  addDay() {
    let dayNode = this.dayTemplate.content.cloneNode(true),
        inputFields = dayNode.querySelectorAll('input'),
        labelFields = dayNode.querySelectorAll('label'),
        $autoComplete = $(dayNode.querySelector('.autocomplete')),
        dayCount = parseInt(this.daysContainer.querySelector('.day:last-of-type')?.dataset?.count) || 0,
        plainDayCount = (dayCount + 1);

    dayNode.querySelector('.day').dataset.count = plainDayCount;
    dayNode.querySelector('.day_count').innerText = plainDayCount + 1;
    inputFields.forEach(field => {
      let name = field.getAttribute('name'),
          id = field.id;

      name = name.replace('{day}', plainDayCount);
      field.setAttribute('name', name);

      id = id.replace('{day}', plainDayCount);
      field.id = id;
    })
    labelFields.forEach(field => {
      let forAttr = field.getAttribute('for');

      forAttr = forAttr.replace('{day}', plainDayCount);
      field.setAttribute('for', forAttr)
    })
    dayNode.querySelector('.add-exercise').addEventListener('click', event => {
      stopDefault(event);
      let exercisesContainer = event.target.previousElementSibling
      this.addExercise(event.target, exercisesContainer);
    })
    dayNode.querySelector('.remove-workout').addEventListener('click', event => {
      stopDefault(event)
      this.deleteExercise(event.target)
    })
    dayNode.querySelector('.remove-day').addEventListener('click', event => {
      stopDefault(event)
      this.deleteDay(event.target)
    })
    dayNode.querySelector('.client-choice-toggle').addEventListener('click', event => {
      this.toggleClientChoice(event.target);
    })
    this.daysContainer.append(dayNode);
    $autoComplete.autocomplete(this.autocompleteOptions);
  }

  deleteExercise(btn) {
    let exercise = btn.closest('.exercise'),
        dayContainer = btn.closest('.days');

    exercise.remove()
    this.updateExercises(dayContainer)
  }

  deleteDay(btn) {
    let day = btn.closest('.day');

    day.remove()
    this.updateDays()
  }

  updateExercises(dayContainer) {
    dayContainer.querySelectorAll('.exercise:visible').forEach((exercise, index) => {
      let exerciseCount = index + 1;
      exercise.querySelector('.workout_count').innerText = exerciseCount;
    })
  }

  updateDays() {
    document.querySelectorAll('.day').forEach((day, index) => {
      let dayCount = index + 1
      day.querySelector('.day_count').innerText = dayCount;
      day.dataset.count = index;
    })
  }

  toggleClientChoice(checkbox) {
    let exercise = checkbox.closest('.exercise'),
        nameField = exercise.querySelector('.workout-name'),
        muscleGroupField = exercise.querySelector('.muscle-group');

    nameField.classList.toggle('d-none', checkbox.checked);
    muscleGroupField.classList.toggle('d-none', !checkbox.checked);
    console.log(exercise);
  }

  init() {
    this.bindAddExerciseBtns();
    this.bindAddDayBtn();
    this.bindDeleteExerciseBtns();
    this.bindDeleteDayBtns();
    this.bindWorkoutSearch();
    this.bindClientChoiceBtn();
  }
}

defaultInit('#new_workout_week', NewWorkout)
