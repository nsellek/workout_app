import { defaultInit, stopDefault } from 'utils'
import 'highcharts'

const ClientDashboard = class {
  constructor(){
    this.editBtn = $('#edit-dashboard')
    this.saveBtn = $('#save-dashboard')
    this.editActions = $('.edit-actions')
    this.addWidgetBtns = $('.add-widget')
  }

  bindDashboardEdit() {
    this.editBtn.on('click', event => {
      stopDefault(event)

      this.editActions.removeClass('d-none')
      this.editBtn.addClass('d-none')
    })
  }

  bindDashboardSave() {
    this.saveBtn.on('click', event => {
      stopDefault(event)

      this.editActions.addClass('d-none')
      this.editBtn.removeClass('d-none')
    })
  }

  bindDashboardAddWidget() {
    this.addWidgetBtns.on('click', event => {
      stopDefault(event)
      let $this = $(event.target)

      console.log($this.data())
    })
  }

  init() {
    this.bindDashboardEdit()
    this.bindDashboardSave()
    this.bindDashboardAddWidget()
  }
}

defaultInit('#client-dashboard', ClientDashboard)
