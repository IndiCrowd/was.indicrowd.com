$(function() {
	$('.use-preview').each(function() {
		var $this = $(this);
		var $find = $this.find('.find');
		var $input = $this.find('input[type="file"]');
		var $img = $this.find('img');

		$find.click(function() {
			$input.click();
		});
		$img.click(function() {
			$input.click();
		});

		$input.change(function() {
			if (!/(\.gif|\.jpg|\.jpeg|\.png)$/i.test(this.value)) {
				alert("이미지 형식의 파일을 선택하십시오");
				this.value = '';
				return;
			}

			var ua = window.navigator.userAgent;

			// IE일때
			if (ua.indexOf("MSIE") > -1) {
				var img_path = "";
				if (this.value.indexOf("\\fakepath\\") < 0) {
					img_path = this.value;
				} else {
					this.select();
					var selectionRange = document.selection.createRange();
					img_path = selectionRange.text.toString();
					this.blur();
				}

				$('<div />').insertAfter($img).css({
					width : $img.outerWidth(),
					height : $img.outerHeight(),
					filter : "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='file://" + img_path + "', sizingMethod='scale')"
				});
				$img.remove();
			}

			// IE를 제외한 최신 브라우저
			else if (this.files && this.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					var img = e.target.result;
					$img.attr('src', img);
				};
				reader.readAsDataURL(this.files[0]);
			}

			// 미리보기가 지원되지 않을때
			else {
				alert('파일이 선택되었으나, 미리보기가 지원되지 않는 브라우저입니다. 최신 브라우저로 업그레이드 해 주시기 바랍니다.');
			}
		});
	});
});