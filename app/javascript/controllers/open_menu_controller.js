import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="open-menu"
export default class extends Controller {
  static targets = ['nav', 'button', 'list'];
  connect() {}
  openMenu() {
    this.buttonTarget.classList.toggle('active');
    this.navTarget.classList.toggle('open');
    this.listTarget.classList.toggle('show');
  }
}
