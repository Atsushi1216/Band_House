// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require jquery
//= require jquery.raty.js

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require audiojs

$('.custom-file-input').on('change', handleFileSelect);
function handleFileSelect(evt) {
		$('#preview').remove();// 繰り返し実行時の処理
		$(this).parents('.input-group').after('<div id="preview"></div>');

	var files = evt.target.files;

	for (var i = 0, f; f = files[i]; i++) {

		var reader = new FileReader();

		reader.onload = (function(theFile) {
			return function(e) {
				if (theFile.type.match('image.*')) {
					var $html = ['<div class="d-inline-block mr-1 mt-1"><img class="img-thumbnail" src="', e.target.result,'" title="', escape(theFile.name), '" style="height:100px;" /><div class="small text-muted text-center">', escape(theFile.name),'</div></div>'].join('');// 画像では画像のプレビューとファイル名の表示
				} else {
					var $html = ['<div class="d-inline-block mr-1"><span class="small">', escape(theFile.name),'</span></div>'].join('');//画像以外はファイル名のみの表示
				}

				$('#preview').append($html);
			};
		})(f);

		reader.readAsDataURL(f);
	}
	$(this).next('.custom-file-label').html(+ files.length + '個のファイルを選択しました');
}

//ファイルの取消
$('.reset').click(function(){
	$(this).parent().prev().children('.custom-file-label').html('ファイル選択...');
	$('#preview').remove();
	$('.custom-file-input').val('');
})
