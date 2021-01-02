
////
//
// Course List - Presentation Component
//
////

import React from 'react';
import CourseListItem from './course_list_item';

const CourseList = ({ courses }) => {

	const courseListItems = courses && courses.map(course => (
		<CourseListItem key={course.id} course={course} />
	));

	return (
		<div className="course-list">
			<h3>Courses</h3>
			<ul className='course-list-items'>
				{courseListItems}
			</ul>
		</div>
	);
};

export default CourseList;
