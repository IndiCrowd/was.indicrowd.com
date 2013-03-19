var timer;
$(window).resize(function(){
    clearTimeout(timer);
    var slider = $('#broadcast-slider').data('movingBoxes');
    slider.options.width = $(window).width() * 0.5; // make 50% browser width
    slider.options.panelWidth = 0.7; // make 70% of wrapper width
    // prevent updating continuously, aka throttle resize
    timer = setTimeout(function(){
        slider.update(false);
    }, 100);
});
$(function(){
	
	$('#broadcast-slider').movingBoxes({
		startPanel   : 1,      // start with this panel
		reducedSize  : 0.8,    // non-current panel size: 80% of panel size
		buildNav     : true,   // if true, navigation links will be added
		navFormatter : function(index, panel){ return panel.find('h2 span').text(); } // function which gets nav text from span inside the panel header

		// width and panelWidth options removed in v2.2.2, but still backwards compatible
		// width        : 500,    // overall width of movingBoxes (not including navigation arrows)
		// panelWidth   : 0.7,    // current panel width

	});
	$('#broadcast-slider').css('visibility','visible');
});