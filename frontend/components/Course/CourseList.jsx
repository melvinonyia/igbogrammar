
////
//
// Class List Presentation Component
//
////

import React from 'react';
import Item from 'components/list/item';

const ClassList = ({ items, resetItems }) => {
	const listItems = items.map((item, idx) => (
		<Item key={idx} item={item} />);

	return (
		<div className="list">
			<ul className='list-items'>
				{listItems}
			</ul>
		</div>);
};

export default ClassList;
