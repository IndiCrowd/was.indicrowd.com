$(function() {

	var $tagHint = $DIV({
		style : {
			position : 'absolute',
			padding : '3px 6px',
			color : '#333',
			backgroundColor : '#eee',
			border : '1px solid #ccc',
			fontSize : '16px',
			cursor : 'pointer',
			fontWeight : 'bold'
		}
	});

	$(document).click(function() {
		$tagHint.hide();
	});

	$('.tagsStr').keyup(function() {
		var $tagsStr = $(this);
		var fontSize = parseInt($tagsStr.css('font-size')) / 2.6;
		var padding = parseInt($tagsStr.css('padding'));
		var pPositon = this.value.lastIndexOf(',');
		var tagsStr = this.value.substring(pPositon + 1);
		var length = this.value.length - tagsStr.length;
		var top = $tagsStr.offset().top;
		var left = $tagsStr.offset().left;
		var height = $tagsStr.outerHeight();

		$tagHint[0].onclick = function() {
			$tagsStr.val($tagsStr.val().substring(0, length) + (pPositon === -1 ? '' : ' ') + $tagHint.text());
		};

		if (tagsStr !== '') {
			$.get(CONTEXT_PATH + '/tag/' + encodeURIComponent(tagsStr) + '.json', function(data) {
				if (data.command !== undefined && data.command !== null) {
					$tagHint.css({
						left : left + length * fontSize + padding,
						top : top + height
					});
					$tagHint.text(data.command.repTagInput.tagInputStr);
					$tagsStr.after($tagHint);
					$tagHint.show();
				}
			}, 'json');
		}
	});
});