import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import pkg from './package.json';

export default defineConfig({
  plugins: [react()],
  base: '/lab01-gXY/',
  define: {
    'import.meta.env.VITE_FRONTEND_VERSION': JSON.stringify(pkg.version)
  }
})