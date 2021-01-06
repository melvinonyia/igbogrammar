
////
//
// Course List Container
//
////

import { connect } from 'react-redux';

// Redux
import { fetchCourses } from '../../../actions/course_actions'; // action creator

// Components
import CourseList from './course_list'; // presentational component to connect

const mapStateToProps = ({ state, entities: { courses } }) => {
	return {
		courses: courses.allIds
	};
};

/*
const mapStateToProps = ({ state, entities: { courses } }) => {
	return {
		courses: state.courses,
	};
};
*/

// component will receive: props.a, props.todos, and props.filter

const mapDispatchToProps = dispatch => ({

	// create action dispatcher
	fetchCourses: () => dispatch(fetchCourses())
});

const CourseListContainer = connect(
	mapStateToProps,
	mapDispatchToProps
)(CourseList);

export default CourseListContainer;
