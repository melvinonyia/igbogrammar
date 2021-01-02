
////
//
// Course List Container
//
////

import { connect } from 'react-redux';
import { fetchCourses } from '../../../actions/course_actions'; // action creator
import CourseList from './course_list'; // presentational component to connect

const mapStateToProps = (state) => ({ // map slice of state to props object
	items: state.items
});

const mapDispatchToProps = dispatch => ({ // create action dispatcher
	fetchCourses: () => dispatch(fetchCourses())
});

const CourseListContainer = connect(
	mapStateToProps,
	mapDispatchToProps
)(CourseList);

export default CourseListContainer;
