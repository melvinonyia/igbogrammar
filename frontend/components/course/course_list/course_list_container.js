
////
//
// Course List Container
//
////

import { connect } from 'react-redux';

// Actions
import { fetchCourses } from '../../../actions/course_actions'; // action creator

// Components
import CourseList from './course_list'; // presentational component to connect

const mapStateToProps = state => ({
	courses: state.courses
});

const mapDispatchToProps = dispatch => ({ // create action dispatcher
	fetchCourses: () => dispatch(fetchCourses())
});

const CourseListContainer = connect(
	mapStateToProps,
	mapDispatchToProps
)(CourseList);

export default CourseListContainer;
