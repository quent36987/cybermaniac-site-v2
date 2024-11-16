import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';
import { astroStatic } from '@astrojs/static';

export default defineConfig({
  site: 'http://localhost:3593', // Indiquez l'URL de base avec le port
  base: '/',                     // Assurez-vous que `base` est défini correctement
  integrations: [sitemap()],
  output: 'static',
  adapter: astroStatic(),
});
