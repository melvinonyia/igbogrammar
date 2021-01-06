
////
//
// Course List - Presentation Component
//
////

import React, { useState } from 'react';

// Components
import CourseListItem from './course_list_item';

const CourseList = ({ courses }) => {
	return(
		<div className="course-list">
			<h3>Courses</h3>
			<ul className='course-list-items'>
				{courses.map((course) => (
					<CourseListItem key={course.id} course={course}/>
					))}
			</ul>
		</div>
	);
}

export default CourseList;
