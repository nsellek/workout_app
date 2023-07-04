import { defaultInit } from "utils";

export const AddSet = class {
  constructor() {
    this.modal;
  }

  bindModalOpen() {
    document.addEventListener('turbo:frame-render', event => {
      let target = event.target

      if (target.id === 'modal') {
        this.modal = new bootstrap.Modal(target.querySelector('#add-set-modal'));
        this.modal.show()
      }
    })
  }

  bindModalClose() {
    document.addEventListener('turbo:submit-end', event => {
      let target = event.target;

      if (target.classList.contains('new_workout_set'))
        this.modal.hide()
    });
  }

  init() {
    this.bindModalOpen()
    this.bindModalClose()
  }
}

defaultInit('#workouts', AddSet)
