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

  addExercise(addBtn, exercisesContainer) {
    let exerciseNode = this.exerciseTemplate.content.cloneNode(true),
        inputFields = exerciseNode.querySelectorAll('input'),
        labelFields = exerciseNode.querySelectorAll('label'),
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
    exercisesContainer.append(exerciseNode);
  }

  addDay() {
    let dayNode = this.dayTemplate.content.cloneNode(true),
        inputFields = dayNode.querySelectorAll('input'),
        labelFields = dayNode.querySelectorAll('label'),
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
    this.daysContainer.append(dayNode);
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

  init() {
    this.bindAddExerciseBtns();
    this.bindAddDayBtn();
    this.bindDeleteExerciseBtns();
    this.bindDeleteDayBtns();
  }
}

defaultInit('#new_workout_week', NewWorkout)
