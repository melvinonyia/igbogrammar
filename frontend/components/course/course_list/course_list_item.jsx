
////
//
// Course List Item - Presentation Component
//
////

import React from 'react';

const CourseListItem = ({ course }) => (
	<div className="course-list-item">
		<h3>{course.name}</h3>
		<span>{course.description}</span>
	</div>
);

export default CourseListItem;
