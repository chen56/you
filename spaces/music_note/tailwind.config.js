/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['node_modules/dasiyui/**/*.{js,ts,jsx,tsx,mdx}','./src/**/*.{js,ts,jsx,tsx,mdx}'],
  theme: {
    extend: {},
  },
  plugins: [require('dasiyui')],
  // plugins: [],
};
