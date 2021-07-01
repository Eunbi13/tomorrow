/**
 * 
 */

var familyType = "";
var style = "";
var detail = "";
var cnt = 0;
var scnt = 0;
var dcnt = 0;

// dropdown

//----------------------가족형태---------------------
$(".fmtOption").on("click", function() {
	console.log($(this).html());
	var fmt = $(this).html();
	
	if(cnt > 0) {
		familyType = familyType + "," + fmt;
	} else {
		familyType = fmt;
	}
	console.log(familyType);
	
	// fmtBtn 추가
	console.log("sample" + $("#sample").html());
	$(".fmtUl").append($("#sample").html());

	$(".fmtUl li:last").children().val(fmt);
	
	cnt++;
	
	fmtDel()
	
	$(".checkFamilyType").val(familyType);
});

// 버튼 누르면 삭제
function fmtDel() {
	$(".delete").each(function(s1, s2) {
		$(s2).on("click", function() {
			$(this).parent().remove();
			
			if(cnt > 0) {
				familyType = familyType.replace(","+$(this).val(), "");
			} else {
				familyType = familyType.replace($(this).val(), "");
			}
			
			cnt--;
			
			console.log(familyType);
		});
	});
}

//----------------------스타일---------------------
$(".styleOption").on("click", function() {
	console.log($(this).html());
	var stt = $(this).html();
	
	if(scnt > 0) {
		style = style + "," + stt;
	} else {
		style = stt;
	}
	console.log(style);
	
	// sttBtn 추가
	console.log("sample" + $("#sample").html());
	$(".sttUl").append($("#sample").html());

	$(".sttUl li:last").children().val(stt);
	
	scnt++;
	
	styleDel()
	
	$(".checkStyle").val(style);
	
});

// 버튼 누르면 삭제
function styleDel() {
	$(".delete").each(function(s1, s2) {
		$(s2).on("click", function() {
			$(this).parent().remove();
			
			if(scnt > 0) {
				style = style.replace(","+$(this).val(), "");
			} else {
				style = style.replace($(this).val(), "");
			}
			
			scnt--;
			
			console.log(style);
		});
	});
}

//----------------------디테일---------------------
$(".detailOption").on("click", function() {
	console.log($(this).html());
	var dtt = $(this).html();
	
	if(dcnt > 0) {
		detail = detail + "," + dtt;
	} else {
		detail = dtt;
	}
	console.log(detail);
	
	// sttBtn 추가
	console.log("sample" + $("#sample").html());
	$(".dttUl").append($("#sample").html());

	$(".dttUl li:last").children().val(dtt);
	
	dcnt++;
	
	detailDel()
	
	$(".checkDetail").val(detail);
	
});

// 버튼 누르면 삭제
function detailDel() {
	$(".delete").each(function(s1, s2) {
		$(s2).on("click", function() {
			$(this).parent().remove();
			
			if(dcnt > 0) {
				detail = detail.replace(","+$(this).val(), "");
			} else {
				detail = detail.replace($(this).val(), "");
			}
			
			dcnt--;
			
			console.log(detail);
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




