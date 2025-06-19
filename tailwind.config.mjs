/** @type {import('tailwindcss').Config} */


export default ({
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  theme: {
    extend: {
      colors: {
        GrisFonce1 : "#171A26",
        GrisFonce2 : "#161824",
        GrisClair : "#262a3b",
        Rose : "#F29BCB",
        Violet : "#a759d9",
      },
    },
  },
  plugins: [],
});