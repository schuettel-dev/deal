import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["email"];

  connect() {
    if(this.emailTarget.value.length === 0) {
      this.emailTarget.value = window.localStorage.getItem('devise--email');
    }
  }

  memorize() {
    window.localStorage.setItem('devise--email', this.emailTarget.value);
  }
}
