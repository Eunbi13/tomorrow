/**
 * 
 */

let familyType = '';
let cnt = 0;
let stCnt = 0;
let dtCnt = 0;

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

// .detailOption 클릭
$(".detailOption").on("click", function() {
	// 해당 value를 fmtBtn의 value로 설정
	// value 추출
	console.log($(this).val());
	dtType = $(this).val();
	
	dtchange()
	
	// fmtBtn 추가
	$("#detail").append($("#sample").html());
	dtCnt++;
	
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

function dtchange() {
	$(".delete").each(function(s1, s2) {
		if(s1 == dtCnt) {
			$(this).val(dtType);
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

// contents 클릭시 사진추가 버튼 생성
$(".contents").on("click", function() {
	
})

// 기간 -> 주, 개월 클릭시 text 변경
$(".week").on("click", function() {
	$("#periodText").text("주");
});