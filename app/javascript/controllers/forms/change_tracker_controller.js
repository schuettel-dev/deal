import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = [
    'form',
    'tracked',
    'showIfFormHasChanges',
    'hideIfFormHasChanges',
    'disableIfFormHasChanges',
    'enableIfFormHasChanges'
  ]

  connect() {
    this.render();
  }

  render() {
    if (this.formHasChanges()) {
      this.hideAll(this.hideIfFormHasChangesTargets);
      this.showAll(this.showIfFormHasChangesTargets);
      this.disableAll(this.disableIfFormHasChangesTargets);
      this.enableAll(this.enableIfFormHasChangesTargets);
    } else {
      this.hideAll(this.showIfFormHasChangesTargets);
      this.showAll(this.hideIfFormHasChangesTargets);
      this.disableAll(this.enableIfFormHasChangesTargets);
      this.enableAll(this.disableIfFormHasChangesTargets);
    }
  }

  hideAll(elements) {
    elements.forEach(element => element.classList.add('hidden'));
  }

  showAll(elements) {
    elements.forEach(element => element.classList.remove('hidden'));
  }

  enableAll(elements) {
    elements.forEach(element => element.removeAttribute('disabled'));
  }

  disableAll(elements) {
    elements.forEach(element => element.setAttribute('disabled', true));
  }

  reset() {
    this.formTarget.reset();
    this.render();
  }

  formHasChanges() {
    return this.trackedTargets.some(element => this.findCurrentValue(element) != this.findDefaultValue(element));
  }

  findCurrentValue(element) {
    switch(element.nodeName) {
      case 'INPUT':
        return element.value;
        break;
      case 'SELECT':
        return true
        break;
      default:
        return 'n/a';
    }
  }

  findDefaultValue(element) {
    switch(element.nodeName) {
      case 'INPUT':
        return element.defaultValue;
        break;
      case 'SELECT':
        return element.options[element.selectedIndex].defaultSelected;
        break;
      default:
        return 'n/a';
    }
  }
}
