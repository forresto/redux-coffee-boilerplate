document.addEventListener('DOMContentLoaded', function(event) { 
    
    // Initialize demo app
    var container = document.getElementById('container');
    var app = ReduxCjsxBoilerplate.App(container);
    var actions = ReduxCjsxBoilerplate.ItemActions;

    // Fake first two actions: loading items and setting loading false
    var loadFixture = function() {
      var items = [
        {id: '000', text: 'hello', done: true},
        {id: '001', text: 'world', done: false}
      ];
      var action = actions.loadItems(items);
      app.store.dispatch(action);
    };
    var setLoading = function() {
      app.store.dispatch({
        type: 'SET_LOADING',
        payload: false
      });
    };
    setTimeout(function() {
      loadFixture();
      setTimeout(setLoading, 500);
    }, 500);

});