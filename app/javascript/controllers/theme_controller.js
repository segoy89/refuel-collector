import ApplicationController from './application_controller'

export default class extends ApplicationController {
  html = document.getElementsByTagName('html')[0]

  switchColor() {
    if (this.html.dataset.theme == 'light_theme') {
      this.html.dataset.theme = 'dark_theme'
    } else {
      this.html.dataset.theme = 'light_theme'
    }

    if (this.isActionCableConnectionOpen()) this.stimulate('ThemeReflex#switch_color')
  }
}
