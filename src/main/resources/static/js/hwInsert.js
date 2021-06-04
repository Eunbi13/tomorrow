/**
 * 
 */

let cnt = 0;

/*$(".fmtOption").each(function(s1, s2) {
	$(s2).on("click", function() {
		console.log($(this).val());
		familyType = $(this).val();
		$("#fmt").append($("#sampleFmt").html());
		// 마지막 div의 index만 value 수정
		console.log(s1);		
	});
});
$(".delete:last").val(familyType);
*/

/*
	$(".fmtOption").on("click", function() {
		console.log($(this).val());
		familyType = $(this).val();
		// 마지막 div의 index만 value 수정
		$(".delete").each(function(s1, s2) {
			console.log(s1);
			cnt = s1;
		});
		$(".delete").each(function(s1, s2) {
			if(s1 == cnt) {
				$(s1).val(familyType);
			}
		});
		$("#fmt").append($("#sampleFmt").html());
	});
	

$(".delete").on("click", function() {
	console.log($(this).html);
	//$(this).parent().remove();
});*/

// button 클릭시 delete
// 눌렀던 버튼을 다시 누르면 delete

	let familyType = '';
// .fmtOption 클릭
$(".fmtOption").on("click", function() {
	// 해당 value를 fmtBtn의 value로 설정
	// value 추출
	console.log($(this).val());
	familyType = $(this).val();
	
	// fmtBtn 추가
	$("#fmt").append($("#sampleFmt").html());
	
	let ar = '';
	
	
	changee()
	
	
});


function changee() {
	$(".delete").each(function(s1, s2) {
		if(s1 == cnt) {
			// fmtBtn value 설정
			$(this).val(familyType);
		}
	});
}
