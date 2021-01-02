
////
//
// Greeting Container Component
//
////

import { connect } from 'react-redux';

// Action creator
import { logout } from '../../actions/session_actions';

// Presentational component to connect
import Greeting from './greeting';

// Map slice of state to props object
const mapStateToProps = ({ session, entities: { users } }) => {
  return {
    currentUser: users[session.id]
  };
};

// Create action dispatcher
const mapDispatchToProps = dispatch => ({
  logout: () => dispatch(logout())
});

//
const GreetingContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(Greeting);

export default GreetingContainer
