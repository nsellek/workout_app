import { defaultInit } from "utils";

export const AddSet = class {
  constructor() {
    this.modal;
  }

  bindModalOpen() {
    document.removeEventListener('turbo:frame-render', this.modalOpenEvent)
    document.addEventListener('turbo:frame-render', this.modalOpenEvent)
  }

  bindModalClose() {
    document.removeEventListener('turbo:submit-end', this.modalCloseEvent)
    document.addEventListener('turbo:submit-end', this.modalCloseEvent);
  }

  bindSwipeMenu() {
    document.removeEventListener('click', this.swipeMenuEvent)
    document.addEventListener('click', this.swipeMenuEvent)
  }

  bindOffcanvasOpen () {
    document.removeEventListener('turbo:frame-render', this.offcanvasOpenEvent)
    document.addEventListener('turbo:frame-render', this.offcanvasOpenEvent)
  }

  modalOpenEvent(event) {
    let target = event.target

    if (target.id === 'modal') {
      this.modal = new bootstrap.Modal(target.querySelector('#set-modal'));
      this.modal.show()
    }
  }

  modalCloseEvent(event) {
    let target = event.target;

    if (target.classList.contains('workout_set_form'))
      this.modal.hide()
  }

  swipeMenuEvent(event) {
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
  }

  offcanvasOpenEvent(event) {
    let target = event.target

    if (target.id === 'offcanvas') {
      new bootstrap.Offcanvas(target.querySelector('#history')).show();
    }
  }

  init() {
    this.bindModalOpen()
    this.bindModalClose()
    this.bindSwipeMenu()
    this.bindOffcanvasOpen()
  }
}

defaultInit('#workouts', AddSet)
