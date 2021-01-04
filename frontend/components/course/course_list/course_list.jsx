
////
//
// Course List - Presentation Component
//
////

import React, { useState } from 'react';
// Components
import CourseListItem from './course_list_item';

class CourseList extends React.Component {

	//
	constructor(props) {
		super(props);
		this.props.fetchCourses();
	}

	//
	componentDidMount() {
		this.props.fetchCourses();
	}

	render() {

		//
		const courses = Object.keys(this.props.courses);

		//
		const courseItems = this.props.courses.map(course => (
				<CourseListItem
					key={course.id}
					course={course}
				/>
			)
		);

		return(
			<div className="course-list">
				<h3>Courses</h3>
				<ul className='course-list-items'>
					{courseItems}
				</ul>
			</div>
		);
	}
}

export default CourseList;
