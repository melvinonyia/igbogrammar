
////
//
// Course Reducer
//
////

import {
  RECEIVE_COURSES,
  RECEIVE_COURSE
} from '../actions/course_actions';

export const initialState = {
  courses: [],
}

const coursesReducer = (state = initialState, action) => {
  //Object.freeze(state) // freezes the state
  switch(action.type) {
    case RECEIVE_COURSES:
      return {
        ...state,
        courses: action.payload,
      }
    case RECEIVE_COURSE:
      const newCourse = { [action.course.id]: action.course };
      return Object.assign({}, state, newCourse);
    default:
      return state;
  }
};

export default coursesReducer;
