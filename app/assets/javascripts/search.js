// This is the JS providing the autocomplete functionality on the search bar
// This is a part of the jQuery UI set of libraries
$('#autocomplete').autocomplete({
	// this first function is creating a callback to return a
	// list of values, which is done by setting up an ajax request
	// to the search url and passing the search term as the query string
	source: function(request, response) {
		$.ajax({
			url: "/search.json",
			dataType: "json",
			data: { term: request.term },
			// when the ajax returns successfully, the data returned is mapped
			// and the value of the resulting title is returned
			success: function(data) {
				response($.map(data, function(value,key) {
					return value.title;
				}));
			}
		});
	},
	// this sets the minimum amount of characters that need to be entered
	// before queries to the server are made
	minLength: 2,
	// this callback is fired when a user clicks on one of the results in
	// the drop down list, sets the value in the search bar, then submits
	// the form.
	select: function(event, ui) {
		$(this).val(ui.item.label);
		$(this).closest('form').submit();
	}
});