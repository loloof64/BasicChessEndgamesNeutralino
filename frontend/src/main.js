import { createApp } from "vue";
import { createI18n } from "vue-i18n";
import App from "./App.vue";
import "./index.css";
import messages from "@/i18n";

import "@loloof64/chessboard-component/dist";

function getLocale() {
  if (navigator.languages != undefined) return navigator.languages[0];
  return navigator.language.substring(0, 2);
}

const locale = getLocale();

console.log(locale);

const i18n = createI18n({
  legacy: false,
  locale,
  fallbackLocale: "en",
  messages,
});

window.addEventListener("contextmenu", function(event) {
  event.preventDefault();
}, {passive: false});

createApp(App).use(i18n).mount("#app");

Neutralino.init()