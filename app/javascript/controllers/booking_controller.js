import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["duration", "totalPrice"];

  updateTotal() {
    const unitPrice = parseFloat(this.data.get("price"));
    const duration = parseInt(this.durationTarget.value);
    const totalPrice = unitPrice * duration;
    this.totalPriceTarget.innerText = totalPrice;
  }
}
