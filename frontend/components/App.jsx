
////
//
// App Component
//
////

import React from "react";
//import { Provider } from 'react-redux';
import {
  Route,
  Redirect,
  Switch,
  Link,
  HashRouter
} from 'react-router-dom';

import GreetingContainer from "./greeting/greeting_container";
import SignUpFormContainer from './session/session_form/signup_form_container';
import LogInFormContainer from './session/session_form/login_form_container';
import CourseListContainer from './course/course_list/course_list_container';
import CourseShowContainer from './course/course_show/course_show_container';
import CourseFormContainer from './course/course_form/course_form_container';
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
      <ProtectedRoute exact path="/courses/new" component={CourseFormContainer} />
      <ProtectedRoute path="/courses" component={CourseListContainer} />
      <ProtectedRoute path="/courses/:courseId" component={CourseShowContainer} />
      <ProtectedRoute exact path="/" component={CourseListContainer} />
    </Switch>
  </div>
);

export default App;
