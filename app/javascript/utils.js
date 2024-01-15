export let defaultInit = (element, callback) => {
  document.addEventListener('turbo:load', () => {
    if (document.querySelector(element))
      (new callback).init();
  })
}

export let stopDefault = (event) => {
  event.preventDefault();
  if (event.stopPropagation)
    event.stopPropagation();
}

export let createToast = (text, opts = {}) => {
  let toastHTML = `
  <div class="toast" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="d-flex">
      <div class="toast-body">
        ${text}
      </div>
      <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
  </div>`,
  toastContainer = document.querySelector('.toast-container'),
  toastElement = createNode(toastHTML);

  toastContainer.append(toastElement);
  new bootstrap.Toast(toastElement, opts).show()
}

export let addEventListener = (nodeList, event, callback) => {
  nodeList.forEach( x => x.addEventListener(event, callback))
}

let createNode = (htmlString) => {
  let placeholder = document.createElement('div');

  placeholder.innerHTML = htmlString;
  return placeholder.firstElementChild
}

export const defaultAutocompleteOptions = {
  minLength: 3,
  classes: {
    "ui-autocomplete": "dropdown-menu autocomplete-dropdown",
    "ui-menu-item-wrapper": "dropdown-item",
    "ui-menu-item": ""
  },
  change: (e, ui) => {
    if (ui.item === null)
      e.target.value = ''
  }
}
