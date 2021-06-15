/**
 * 
 */

let familyType = "";
let cnt = 0;

// dropdown
// button click > active > add array > ajax insert

$(".fmtOption").on("click", function() {
	console.log($(this).html());
	fmt = $(this).html();
	
	if(cnt > 0) {
		familyType = familyType + "," + fmt;
	} else {
		familyType = fmt;
	}
	console.log(familyType);
	
	cnt++;
});

// 버튼 누르면 삭제
function del() {
	$(".delete").each(function(s1, s2) {
		$(s2).on("click", function() {
			$(this).parent().remove();
		});
	});
}

// 기간 -> 주, 개월 클릭시 text 변경
$(".week").on("click", function() {
	$("#periodText").text("주");
});
$(".month").on("click", function() {
	$("#periodText").text("개월");
});

// checkbox
// checkbox click > checked > add array > ajax insert
let ar = ['black', 'white', 'gray', 'beige', 'brown', 'darkbrown', 
		'red', 'pink', 'yellow', 'green', 'mint', 'blue', 'darkblue'];
let checkTone = '';	

// 각 checkbox, radio에 값 저장
$(".total").each(function(s1) {
	for(let i=0; i<ar.length; i++) {
		if(s1 == i) {
			$("input:checkbox[id=totalTone" + i + "]").val(ar[i]);
			$("input:radio[id=wallColor" + i + "]").val(ar[i]);
			$("input:radio[id=bottomColor" + i + "]").val(ar[i]);
			//console.log("wallColor" + i + ":" + $("input:radio[id=wallColor" + i + "]").val());
			//console.log("bottomColor" + i + ":" + $("input:radio[id=bottomColor" + i + "]").val());
		}
	}
});

// totalTone 체크 시
/*
$("input:checkbox[class='total']").on("change", function() {	
	for (let i=0; i<ar.length(); i++) {
		if ($("input:checkbox[id=totalTone" + i + "]").is(":checked") == true) {
			checkTone = checkTone + $("input:checkbox[id=totalTone"+ i + "]").val();
			$("#checkTotalTone").val(checkTone);
			if ($("input:checkbox[class='total']:checked").length > 1) {			// 복수 선택시 , 추가 (Controller에서 ,기준으로 자름)
				checkTone = checkTone + ",";
				console.log(checkTone);
			}
		}
	}
});
*/


// contents 클릭시 사진추가 버튼 생성
$(".contents").on("click", function() {
	
});


// 파일첨부에 이미지 파일만 선택 가능
/*
function fileCheck(obj) {
	let pathPoint = obj.value.lastIndexOf('.');
	let filePoint = obj.value.substring(pathPoint+1, obj.length);
	let fileType = filePoint.toLowerCase();
	
	if(fileType == 'jpg'||fileType == 'gif'||fileType == 'png'||fileType == 'jpeg'||fileType == 'bmp') {
		// 정상적인 이미지 확장자 파일
	} else {
		alert('이미지 파일이 아닙니다.');
		let parentObj = obj.parentNode;
		let node = parentObj.replaceChild(obj.cloneNode(true), obj);
		return false;
	}
	
	if(filetype == 'bmp') {
		let upload = confirm('적절한 이미지 포맷이 아닙니다. 그래도 계속 하시겠습니까?');
		if(!upload) {
			return false;
		}
	}
}
*/



/*
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
*/

