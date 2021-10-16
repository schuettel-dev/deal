// const moveCursorToEnd = (element) => {
//   if (typeof element.selectionStart == "number") {
//     element.selectionStart = element.selectionEnd = element.value.length;
//   } else if (typeof element.createTextRange != "undefined") {
//     element.focus();
//     var range = element.createTextRange();
//     range.collapse(false);
//     range.select();
//   }
// }

const moveCursorToEnd = (element) => {
  element.addEventListener('focus', () => {
    // const that = this;
    setTimeout(function(){ element.selectionStart = element.selectionEnd = 10000; }, 0);
  });
}

export { moveCursorToEnd };
