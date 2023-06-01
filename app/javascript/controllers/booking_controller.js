import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['price', 'duration', 'totalPrice'];

  updateTotal() {
    const price = parseInt(this.priceTarget.innerText, 10)
    const duration = parseInt(this.durationTarget.value, 10)
    const totalPrice = price * duration;

    this.totalPriceTarget.innerText = `${totalPrice}€`;
  }
}
