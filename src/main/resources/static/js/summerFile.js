/**
 * 
 */


$("#contents").summernote({
	height: 500,								// 처음 시작 크기
	placeholder: '',
	callbacks: {
	    onImageUpload: function(files) {		// files 는 이미지파일, 배열
	    	uploadFile(files);
	    },
		onMediaDelete: function(files) {
			deleteFile(files);
		}
	}
});

function deleteFile(files) {
	let fileName = $(files[0]).attr("src");
	fileName = fileName.substring(fileName.lastIndexOf("/")+1);
	console.log(fileName);
	$.post("summerFileDelete", {fileName: fileName}, function(result) {
		console.log(result);
	});
}

function uploadFile(files) {
	
	// 파일 업로드 method : post, encType : multipart/form-data
	const formData = new FormData();		// form 태그 생성
	formData.append('file', files[0]);		// input type="file" name="file"
	let fileName = "";
	
	// ajax를 통해 보냄
	$.ajax({
		type: "POST",
		url: "./summerFileUpload",
		data: formData,
		enctype: "multipart/form-data",
		cache: false,
		processData: false,
		contentType: false,
		success: function(result) {	
			fileName = result.trim();
			$("#contents").summernote('insertImage', fileName);
		}
	});
}