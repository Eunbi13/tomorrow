/**
 * 파일이름 읽어오기(파일이미지 미리보기와 동일)
 */
$(document).ready(function(){
	$('input[ type="file"]').change(function(){
		let fileList = this.files;
		let reader = new FileReader();
		$('.btn-file-name').text(fileList[0].name)
		
	})
})
