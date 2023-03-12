import { defaultInit, stopDefault, addEventListener } from "utils";

const NewWorkout = class {
  constructor() {
    this.addExerciseBtns = document.querySelectorAll('.add-exercise');
    this.exerciseTemplate = document.querySelector('#exercise-template');
    this.addDayBtn = document.querySelector('.add-day');
    this.dayTemplate = document.querySelector('#day-template');
    this.daysContainer = document.querySelector('.days');
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

  bindAddExerciseLogic(event) {
    
  }

  addExercise(addBtn, exercisesContainer) {
    let exerciseNode = this.exerciseTemplate.content.cloneNode(true),
        inputFields = exerciseNode.querySelectorAll('input'),
        labelFields = exerciseNode.querySelectorAll('label'),
        exerciseCount = exercisesContainer.querySelectorAll('.exercise').length,
        dayCount = addBtn.closest('.day').dataset.count - 1;

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

      forAttr = forAttr.replace('{exercise]', exerciseCount).replace('{day}', dayCount)
      field.setAttribute('for', forAttr);
    })
    exercisesContainer.append(exerciseNode);
  }

  addDay() {
    let dayNode = this.dayTemplate.content.cloneNode(true),
        inputFields = dayNode.querySelectorAll('input'),
        labelFields = dayNode.querySelectorAll('label'),
        dayCount = parseInt(this.daysContainer.querySelector('.day:last-of-type').dataset.count),
        plainDayCount = (dayCount + 1);

    dayNode.querySelector('.day').dataset.count = plainDayCount;
    dayNode.querySelector('.day_count').innerText = plainDayCount;
    inputFields.forEach(field => {
      let name = field.getAttribute('name'),
          id = field.id;

      name = name.replace('{day}', dayCount);
      field.setAttribute('name', name);

      id = id.replace('{day}', dayCount);
      field.id = id;
    })
    labelFields.forEach(field => {
      let forAttr = field.getAttribute('for');

      forAttr = forAttr.replace('{day}', dayCount);
      field.setAttribute('for', forAttr)
    })
    dayNode.querySelector('.add-exercise').addEventListener('click', event => {
      stopDefault(event);
      let exercisesContainer = event.target.previousElementSibling
      this.addExercise(event.target, exercisesContainer);
    })
    this.daysContainer.append(dayNode);
  }

  init() {
    this.bindAddExerciseBtns();
    this.bindAddDayBtn();
  }
}

defaultInit('#new_workout_week', NewWorkout)
