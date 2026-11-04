import { defineConfig } from 'astro/config';

export default defineConfig({
  vite: {
    build: {
      // Conserve une syntaxe CSS compatible avec les anciens navigateurs
      // (ex. media queries "min-width" au lieu de "width>=" pour Safari < 16.4)
      cssTarget: ['chrome87', 'edge88', 'firefox78', 'safari14'],
    },
  },
});
