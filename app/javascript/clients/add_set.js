import { defaultInit } from "utils";

export const AddSet = class {
  constructor() {
    this.modal;
  }

  bindModalOpen() {
    document.addEventListener('turbo:frame-render', event => {
      let target = event.target

      if (target.id === 'modal') {
        this.modal = new bootstrap.Modal(target.querySelector('#set-modal'));
        this.modal.show()
      }
    })
  }

  bindModalClose() {
    document.addEventListener('turbo:submit-end', event => {
      let target = event.target;
      console.log(target)
      if (target.classList.contains('workout_set_form'))
        this.modal.hide()
    });
  }

  bindSwipeMenu() {
    document.addEventListener('click', event => {
      let target = event.target.closest('.swipe-menu')?.closest('.swap-item'),
          swapItems = document.querySelectorAll('.swap-item');

      if (target) {
        if (target.classList.contains('swap-open'))
          target.classList.remove('swap-open');
        else {
          swapItems.forEach( e => e.classList.remove('swap-open'));
          target.classList.add('swap-open')
        }
      }
    })
  }

  init() {
    this.bindModalOpen()
    this.bindModalClose()
    this.bindSwipeMenu()
  }
}

defaultInit('#workouts', AddSet)
