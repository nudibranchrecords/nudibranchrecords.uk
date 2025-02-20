import { defineConfig } from "vite";
import { ViteEjsPlugin } from "vite-plugin-ejs";
import vitePluginString from "vite-plugin-string";

export default defineConfig({
  plugins: [ViteEjsPlugin(), vitePluginString()],
  build: {
    outDir: "dist",
  },
});
