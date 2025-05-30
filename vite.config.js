// vite.config.js
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  server: {
    proxy: {
      // no rewrite, preserve /api prefix
      '/api': {
        target: 'http://localhost:9090',
        changeOrigin: true,
      },
    },
  },
});
