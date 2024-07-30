function logoutFromAllTabs() {
    localStorage.setItem('checkLoggedOut', Date.now()); 
}

window.addEventListener('storage', function(event) {
    if (event.key === 'checkLoggedOut') {
        window.location.href = '/login/';
    }
});
