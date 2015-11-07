/*

layout initialization

*/

(function($){
	var initLayout = function() {
        // example 1
		$('a.example1').zoomimage();

        // example 2
		$('a.example2').zoomimage({
			border: 20,
			centered: true,
			hideSource: true
		});

        // example 3
		$('a.example3').zoomimage({
			controlsTrigger: 'mouseover',
			className: 'custom',
			shadow: 40,
			controls: false,
			opacity: 1,
			beforeZoomIn: function(boxID) {
				$('#' + boxID)
					.find('img')
					.css('opacity', 0)
					.animate(
						{'opacity':1},
						{ duration: 600, queue: false }
					);
			},
			beforeZoomOut: function(boxID) {
				$('#' + boxID)
					.find('img')
					.css('opacity', 1)
					.animate(
						{'opacity':0},
						{ duration: 600, queue: false }
					);
			}
		});
	};

	EYE.register(initLayout, 'init');
})(jQuery)