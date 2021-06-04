/**
 * 
 */

let familyType = '';
let cnt = 0;
let stCnt = 0;

// button 클릭시 delete
// 눌렀던 버튼을 다시 누르면 delete

// .fmtOption 클릭
$(".fmtOption").on("click", function() {
	// 해당 value를 fmtBtn의 value로 설정
	// value 추출
	console.log($(this).val());
	familyType = $(this).val();
	
	changee()
	
	// fmtBtn 추가
	$("#fmt").append($("#sample").html());
	cnt++;
	
	del()
	
});

// .styleOption 클릭
$(".styleOption").on("click", function() {
	// 해당 value를 fmtBtn의 value로 설정
	// value 추출
	console.log($(this).val());
	stType = $(this).val();
	
	stchange()
	
	// fmtBtn 추가
	$("#style").append($("#sample").html());
	stCnt++;
	
	del()
	
});


function changee() {
	$(".delete").each(function(s1, s2) {
		if(s1 == cnt) {
			// fmtBtn value 설정
			$(this).val(familyType);
		}
	});
}

function stchange() {
	$(".delete").each(function(s1, s2) {
		if(s1 == stCnt) {
			$(this).val(stType);
		}
	});
}


function del() {
	$(".delete").each(function(s1, s2) {
		$(s2).on("click", function() {
			$(this).parent().remove();
		});
	});
}