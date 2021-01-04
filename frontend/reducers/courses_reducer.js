
////
//
// Course Reducer
//
////

import {
  RECEIVE_COURSES,
  RECEIVE_COURSE
} from '../actions/course_actions';

const coursesReducer = (state = {}, action) => {
  Object.freeze(state) // freezes the state
  switch(action.type) {
    case RECEIVE_COURSES:
      return action.courses
    case RECEIVE_COURSE:
      const newCourse = { [action.course.id]: action.course };
      return Object.assign({}, state, newCourse);
    default:
      return state;
  }
};

export default coursesReducer;
