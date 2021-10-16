import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["password", "submit"];
  static values = { minimumPasswordLength: Number }

  connect() {
    this.render()
  }

  render() {
    this.renderSubmitButton();
  }

  renderSubmitButton() {
    if (this.minimalPasswordLengthReached()) {
      this.submitTarget.removeAttribute('disabled', 'disabled');
    } else {
      this.submitTarget.setAttribute('disabled', 'disabled');
    }
  }

  minimalPasswordLengthReached() {
    return this.passwordTarget.value.length >= this.minimumPasswordLengthValue;
  }
}
