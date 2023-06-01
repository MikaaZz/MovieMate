import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "results"];

  connect() {
    console.log("Search controller connected");
  }

  search() {
    const query = this.inputTarget.value.trim();
    if (query.length > 0) {
      this.fetchListings(query);
    } else {
      this.fetchListings_alt();
    }
  }

  fetchListings(query) {
    fetch(`/listings?query=${encodeURIComponent(query)}`, { method: "GET", headers: {"Accept": "application/json"} })
      .then((response) => response.json())
      .then((data) => {
        this.resultsTarget.outerHTML = data.listings;
      })
      .catch((error) => {
        console.error(error);
      });
  }

  fetchListings_alt() {
    fetch(`/listings`, { method: "GET", headers: {"Accept": "application/json"} })
      .then((response) => response.json())
      .then((data) => {
        this.resultsTarget.outerHTML = data.listings;
      })
      .catch((error) => {
        console.error(error);
      });
  }

  handleInput(event) {
    this.search();
  }
}
