module.exports = {
  mode: 'jit',
  purge: [
    "./app/**/*.html.haml",
    "./app/components/*.html.haml",
    "./app/components/*.rb",
    "./app/javascript/styles/**/*.css",
    "./app/javascript/controllers/**/*.js"
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
