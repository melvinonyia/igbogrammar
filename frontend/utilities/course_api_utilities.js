
////
//
// Course API Utilities
//
////

// Login API
export const fetchCourses = data => (
  $.ajax({
    method: 'POST',
    url: '/api/session',
    data: { user }
  })
);

// Signup API
export const fetchCourse = id => (
  $.ajax({
    method: 'POST',
    url: '/api/user',
    data: { user }
  })
);

// Logout API
export const logout = () => (
  $.ajax({
    method: 'DELETE',
    url: '/api/session'
  })
);
