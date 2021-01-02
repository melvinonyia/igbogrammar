
////
//
// Course Actions
//
////

import * as APIUtilities from '../utilities/course_api_utilities';

////
// Action Types
////

export const RECEIVE_COURSES = 'RECEIVE_COURSES';
export const RECEIVE_COURSE = 'RECEIVE_COURSE';


////
// Regular action creators
////

// Accept courses object
export const receiveCourses = courses => ({
  type: RECEIVE_COURSES,
  courses
});

// Accept a course argument
export const receiveCourse = ({ course }) => ({
  type: RECEIVE_COURSE,
  course
});


////
// Thunk action creators
////

export const fetchCourses = filters => dispatch => (
  APIUtilities.fetchCourses(filters).then(courses => (
    dispatch(receiveCourses(courses))
  ))
);

export const fetchCourse = id => dispatch => (
  APIUtilities.fetchCourse(id).then(payload => (
    dispatch(receiveCourse(payload))
  ))
);

export const createCourse = course => dispatch => (
  APIUtilities.createCourse(course).then(course => (
    dispatch(receiveCourse(course))
  ))
);

export const editCourse = course => dispatch => (
  APIUtilities.editCourse(course).then(course => (
    dispatch(receiveCourse(course))
  ))
);

export const deleteCourse = course => dispatch => (
  APIUtilities.deleteCourse(course).then(course => (
    dispatch(receiveCourse(course))
  ))
);
