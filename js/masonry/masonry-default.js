jQuery(document).ready(function($){
	var $loadingIndicator;
	
	$( function() {
		var $container = $('#topic-thumbs');
		$loadingIndicator = $('#loading-indicator');
		// hide initial items
		var $initialItems = $container.find('.masonry-item').hide();
		
		var $container = $container.masonry({
			itemSelector: 'no-item',
			columnWidth: '.grid-sizer',
			stamp: '.stamp'
		})
		// set proper itemSelector
		.masonry( 'option', { itemSelector: '.masonry-item' })
		.masonryImagesReveal( $initialItems );
	});

	// reveals all items after all item images
	// have been loaded
	$.fn.masonryImagesReveal = function( $items ) {
		var msnry = this.data('masonry');
		var itemSelector = msnry.options.itemSelector;
		$loadingIndicator.show();
		// hide by default
		$items.hide();
		// append to container
		this.append( $items );
		// Masonry
		WebFontConfig = {
			google: { 
				families: [ 'PT+Sans:400,700:latin,cyrillic' ]
			},
			active: function() {
				$items.imagesLoaded( function() {
					// un-hide items
					$items.show();
					$loadingIndicator.hide();
					// reveal all of them
					msnry.appended( $items );
				});
			}
		};
		(function() {
			var wf = document.createElement('script');
			wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
				'://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
			wf.type = 'text/javascript';
			wf.async = 'true';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(wf, s);
		})();
		
		return this;
	};
	
	ls.hook.add('ls_block_onload_html_after',function(){
		$('#topic-thumbs').masonry( 'reloadItems' ).masonry();
	});
});