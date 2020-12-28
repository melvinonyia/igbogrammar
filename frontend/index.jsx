// React
import React from "react";
import ReactDOM from "react-dom";

// Redux
import configureStore from './store/store';

// Components
import Root from "./components/root";

document.addEventListener("DOMContentLoaded", () => {

  const store = configureStore();

  // TESTING START
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  // TESTING END

  const root = document.getElementById("root")
  ReactDOM.render(<Root store={store} />, root);

});
