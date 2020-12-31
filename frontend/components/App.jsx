////
//
// App Component
//
////

import React from "react";
import { Provider } from 'react-redux';
import {
  Route,
  Redirect,
  Switch,
  Link,
  HashRouter
} from 'react-router-dom';

import GreetingContainer from "./Greeting/greeting_container";
import SignUpFormContainer from './Session/signup_form_container';
import LogInFormContainer from './Session/login_form_container';
import { AuthRoute, ProtectedRoute } from '../utilities/route_utilities';

const App = () => (
  <div>
    <header>
      <Link to="/" className="header-link">
        <h1>Igbo Grammar</h1>
      </Link>
      <GreetingContainer />
    </header>
    <Switch>
      <AuthRoute exact path="/login" component={LogInFormContainer} />
      <AuthRoute exact path="/signup" component={SignUpFormContainer} />
    </Switch>
  </div>);

export default App;
