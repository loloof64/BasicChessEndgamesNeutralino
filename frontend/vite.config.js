import { defineConfig } from "vite";
import { resolve, dirname } from 'node:path'
import { fileURLToPath } from 'url'
import vue from "@vitejs/plugin-vue";
import vueI18n from "@intlify/vite-plugin-vue-i18n";

import path from "path";

// https://vitejs.dev/config/
export default defineConfig({
  server: {
    port: 8080,
  },
  plugins: [
    vue(),
    vueI18n({
      // if you want to use Vue I18n Legacy API, you need to set `compositionOnly: false`
      // compositionOnly: false,

      // you need to set i18n resource including paths !
      include: resolve(
        dirname(fileURLToPath(import.meta.url)),
        "./i18n/**"
      ),
    }),
  ],
  resolve: {
    alias: {
      "@": path.resolve(__dirname, "/src"),
    },
  },
});
