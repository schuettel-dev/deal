import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["defaultContent", "toggleContent"]
  static values = { showToggleContent: Boolean }

  connect() {
    this.render();
  }

  render() {
    this.renderFields();
  }

  renderFields() {
    this.defaultContentTargets.map(element => element.classList.toggle('hidden', this.showToggleContentValue))
    this.toggleContentTargets.map(element => element.classList.toggle('hidden', !this.showToggleContentValue))
  }

  showToggleContent() {
    this.showToggleContentValue = true;
    this.render();
  }

  showDefaultContent() {
    this.showToggleContentValue = false;
    this.render();
  }

  // toggleDisable(field, visible) {
  //   if (this.visibleValue) {
  //     field.removeAttribute('disabled')
  //   } else {
  //     field.setAttribute('disabled', true);
  //   }
  // }
}
