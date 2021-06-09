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
	type = $(this).val();
	
	$(".delete").each(function(s1, s2) {
		if(s1 == cnt) {
			// fmtBtn value 설정
			console.log($(this).val());
			$(this).val(type);
			console.log($(this).val());
		}
	});
	
	// fmtBtn 추가
	console.log("sample" + $("#sample").html());
	$("#fmt").append($("#sample").html());
	cnt++;
	
	del()
	
});

// .styleOption 클릭
$(".styleOption").on("click", function() {
	// 해당 value를 fmtBtn의 value로 설정
	// value 추출
	console.log($(this).val());
	type = $(this).val();
	
	$(".delete").each(function(s1, s2) {
		if(s1 == stCnt) {
			// fmtBtn value 설정
			console.log($(this).val());
			$(this).val(type);
			console.log($(this).val());
		}
	});
	
	// fmtBtn 추가
	console.log("sample" + $("#sample").html());
	$("#style").append($("#sample").html());
	stCnt++;
	
	del()
	
});

// .detailOption 클릭
$(".detailOption").on("click", function() {
	// 해당 value를 fmtBtn의 value로 설정
	// value 추출
	console.log($(this).val());
	type = $(this).val();
	
	$(".delete").each(function(s1, s2) {
		if(s1 == dtCnt) {
			// fmtBtn value 설정
			console.log($(this).val());
			$(this).val(type);
			console.log($(this).val());
		}
	});
	
	// fmtBtn 추가
	console.log("sample" + $("#sample").html());
	$("#detail").append($("#sample").html());
	dtCnt++;
	
	del()
	
});


function changee() {
	$(".delete").each(function(s1, s2) {
		if(s1 == cnt) {
			// fmtBtn value 설정
			$(this).val(type);
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
$(".month").on("click", function() {
	$("#periodText").text("개월");
});

let ar = ['black', 'white', 'gray', 'beige', 'brown', 'darkbrown', 
		'red', 'pink', 'yellow', 'green', 'mint', 'blue', 'darkblue'];
let checkTone = '';		

/*
$(".total").each(function(s1, s2) {
	for(let i in ar) {
		if(s1 == i) {
			che
		}
	}
	console.log(s1);
	
});
*/








