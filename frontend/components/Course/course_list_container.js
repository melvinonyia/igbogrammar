
////
//
// Class List Container Component
//
////

import { connect } from 'react-redux';
//import { resetItems } from '../../actions/items' // action creator
import ClassList from './ClassList'; // presentational component to connect

const mapStateToProps = (state) => ({ // map slice of state to props object
	items: state.items
});

const mapDispatchToProps = (dispatch) => ({ // create action dispatcher
	resetItems: () => dispatch(resetItems());
});

const ClassListContainer = connect(
	mapStateToProps,
	mapDispatchToProps
)(ClassList);

export default ClassListContainer;
