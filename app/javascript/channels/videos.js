$(document).on('turbolinks:load', function(){
	var videos = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.whitespace,
	    queryTokenizer: Bloodhound.tokenizers.whitespace,        
            remote: {
	       url: 'videos/autocomplete?query=%QUERY'
               wildcard: '%QUERY'
            }
	});
        $('#videos_search').typeahead(null, {
           source: videos
        });
})
