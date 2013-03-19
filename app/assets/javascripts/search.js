$('#autocomplete').autocomplete({
	source: function(request, response) {
		$.ajax({
			url: "/search.json",
			dataType: "json",
			data: { term: request.term },
			success: function(data) {
				response($.map(data, function(value,key) {
					console.log(value)
					return value.title
				}));
			}
		});
	},
	minLength: 2,
	select: function(event, ui) {
		$(this).val(ui.item.label);
		$(this).closest('form').submit();
	}
});