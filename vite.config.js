import { defineConfig } from "vite";
import { ViteEjsPlugin } from "vite-plugin-ejs";
import vitePluginString from "vite-plugin-string";

export default defineConfig({
  base: "", // Force relative paths for GitHub Pages
  plugins: [ViteEjsPlugin(), vitePluginString()],
  build: {
    outDir: "dist",
  },
});
