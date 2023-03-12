import { defaultInit, stopDefault, createToast } from "utils";

const ClientsInvite = class {
  constructor() {
    this.inviteField = document.querySelector('#invite_field');
    this.textBtn = document.querySelector('#text_btn');
    this.copyBtn = document.querySelector('#copy_btn');
    this.emailBtn = document.querySelector('#email_btn');
  }

  bindCopyBtn() {
    this.copyBtn.addEventListener('click', event => {
      stopDefault(event);
      navigator.clipboard.writeText(this.inviteField.value);
      createToast('Successfully copied invite link!');
    })
  }

  init() {
    this.bindCopyBtn();
  }
}

defaultInit('#invite_field', ClientsInvite);
