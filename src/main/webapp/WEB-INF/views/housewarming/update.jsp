<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<%-- <c:import url="../template/summernote.jsp"></c:import> --%>
<meta charset="UTF-8">
<title>내일부터 하는 인테리어, 내일의 집</title>
<style>
.fakeimg {
	height: 200px;
	background: #aaa;
}
</style>
</head>
<body>

	<nav class="navbar navbar-expand-md navbar-light fixed-top bg-light">
		<a class="navbar-brand" href="/">내일의 집</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<!-- <a type="button" class="nav-link addPic">pic</a> -->
					<button type="button" class="note-btn btn btn-lg" tabindex="-1" title="" aria-label="Picture" data-original-title="Picture">
						<i class="note-icon-picture"></i>
					</button>
				</li>
				<li class="nav-item">
					<a type="button" class="nav-link setTitle">제목</a>
				</li>
				<li class="nav-item">
					<a type="button" class="nav-link setContents">본문</a>
				</li>
				<li class="nav-item">
					<a type="button" class="nav-link setBord">bord</a>
				</li>
				<li class="nav-item">
					<a type="button" class="nav-link setItalic">italic</a>
				</li>
				<li class="nav-item">
					<a type="button" class="nav-link setUnder">under</a>
				</li>
				<li class="nav-item">
					<a type="button" class="nav-link setColor">black</a>
				</li>
				<li class="nav-item">
					<a type="button" class="nav-link setColor">red</a>
				</li>
				<li class="nav-item">
					<a type="button" class="nav-link setColor">blue</a>
				</li>
				<li class="nav-item"
					><a type="button" class="nav-link setLink">link</a>
				</li>
			</ul>

			<form class="form-inline mt-2 mt-md-0">
				<button class="btn btn-outline-primary my-2 my-sm-3 save" type="submit">임시저장</button>
				<button class="btn btn-primary my-2 my-sm-3 submit" type="submit">발행신청</button>
			</form>
		</div>
	</nav>
</head>
<body>

	<div class="container" style="margin-top: 100px">

		<form id="frm" action="./insert" method="post" enctype="multipart/form-data">
			<div class="accordion" id="detailForm">
				<div class="card">
					<div class="card-head" id="headingOne">
						<h2 class="mb-0">
							<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
								필수정보입력
							</button>
						</h2>
					</div>

					<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#detailForm">
						<div class="card-body">
							<div class="form-group">
								<label for="space">공간</label> 
								<select class="form-control myCheck" id="space" name="space">
									<option>선택해주세요.</option>
									<option>원룸&오피스텔</option>
									<option>아파트</option>
									<option>빌라&연립</option>
									<option>단독주택</option>
									<option>사무공간</option>
									<option>상업공간</option>
									<option>기타</option>
								</select>
							</div>
							<div class="form-group">
								<label for="spaceSize">평수</label> 
								<input type="text" class="form-control myCheck" id="spaceSize" name="spaceSize">
							</div>
							<div class="form-group">
								<label for="work">작업</label>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" id="work" name="work" value="self"> 
									<label class="form-check-label" for="inlineRadio1">셀프,DIY</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" id="work" name="work" value="halfself"> 
									<label class="form-check-label" for="inlineRadio2">반셀프</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" id="work" name="work" value="expert"> 
									<label class="form-check-label" for="inlineRadio3">전문가</label>
								</div>
							</div>
							<div class="form-group">
								<label for="field">분야</label> 
								<select class="form-control myCheck" id="field" name="field">
									<option>선택해주세요.</option>
									<option>리모델링</option>
									<option>홈스타일링</option>
									<option>부분공사</option>
									<option>건축</option>
								</select>
							</div>
							<div class="form-group">
								<label for="familyType">가족형태</label>
								<!-- <input type="text" class="form-control myCheck" id="familyType" name="familyType"> -->
								<div class="dropdown">
									<button class="btn btn-outline-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										선택해주세요.
									</button>
									<div class="dropdown-menu familyType">
										<a class="dropdown-item fmtOption" type="button">싱글라이프</a> 
										<a class="dropdown-item fmtOption" type="button">신혼부부</a> 
										<a class="dropdown-item fmtOption" type="button">아기가 있는 집</a> 
										<a class="dropdown-item fmtOption" type="button">취학 자녀가 있는 집</a>
										<a class="dropdown-item fmtOption" type="button">부모님과 함께 사는 집</a> 
										<a class="dropdown-item fmtOption" type="button">기타</a>
									</div>
								</div>

								<div id="fmt">
									<!-- dropdown 버튼 클릭시 버튼 추가, 삭제 -->
								</div>

							</div>

							<div class="form-group">
								<label for="area">지역</label>
								<div class="dropdown">
									<button class="btn btn-outline-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										선택해주세요.
									</button>
									<div class="dropdown-menu style">
										<input class="dropdown-item" type="button" value="서울특별시">
										<input class="dropdown-item" type="button" value="부산광역시"> 
										<input class="dropdown-item" type="button" value="대구광역시">
										<input class="dropdown-item" type="button" value="인천광역시"> 
										<input class="dropdown-item" type="button" value="광주광역시"> 
										<input class="dropdown-item" type="button" value="대전광역시"> 
										<input class="dropdown-item" type="button" value="울산광역시"> 
										<input class="dropdown-item" type="button" value="강원도"> 
										<input class="dropdown-item" type="button" value="경기도"> 
										<input class="dropdown-item" type="button" value="경상남도"> 
										<input class="dropdown-item" type="button" value="경상북도">
										<input class="dropdown-item" type="button" value="전라남도"> 
										<input class="dropdown-item" type="button" value="전라북도"> 
										<input class="dropdown-item" type="button" value="충청남도"> 
										<input class="dropdown-item" type="button" value="충청북도"> 
										<input class="dropdown-item" type="button" value="세종특별자치시"> 
										<input class="dropdown-item" type="button" value="제주특별자치도"> 
									</div>
								</div>
								<input type="hidden" class="form-control myCheck" id="area" name="area">
							</div>
							<div class="form-group">
								<label for="style">스타일</label>
								<div class="dropdown">
									<button class="btn btn-outline-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										선택해주세요.
									</button>
									<div class="dropdown-menu style">
										<input class="dropdown-item styleOption" type="button" value="모던">
										<input class="dropdown-item styleOption" type="button" value="미니멀&심플"> 
										<input class="dropdown-item styleOption" type="button" value="내추럴">
										<input class="dropdown-item styleOption" type="button" value="북유럽"> 
										<input class="dropdown-item styleOption" type="button" value="빈티지&레트로"> 
										<input class="dropdown-item styleOption" type="button" value="클래식&앤틱"> 
										<input class="dropdown-item styleOption" type="button" value="프렌치&프로방스"> 
										<input class="dropdown-item styleOption" type="button" value="러블리&로맨틱"> 
										<input class="dropdown-item styleOption" type="button" value="인터스트리얼"> 
										<input class="dropdown-item styleOption" type="button" value="한국&아시아"> 
										<input class="dropdown-item styleOption" type="button" value="유니크&믹스매치">
									</div>
								</div>
								<div id="style">
									<!-- dropdown 버튼 클릭시 버튼 추가, 삭제 -->
								</div>
							</div>
							<div class="form-group">
								<label for="period">기간</label>
								<div class="input-group">
									<input type="text" class="form-control myCheck" id="period" name="period">
									<p id="periodText"></p>
									<input type="radio" class="form-control myCheck week" id="periodType" name="periodType"> 
									<label for="periodType">주</label> 
									<input type="radio" class="form-control myCheck month" id="periodType" name="periodType"> 
									<label for="periodType">개월</label>
								</div>
							</div>
							<div class="form-group">
								<label for="budget">예산</label> 
								<input type="text" class="form-control myCheck" id="budget" name="budget">
							</div>
							<div class="form-group">
								<label for="totalTone">전체톤</label>
								<div class="input-group">
									<c:forEach begin="0" end="12" var="i">
										<input type="checkbox" class="form-control myCheck total" id="totalTone${i}">
									</c:forEach>
									<input type="hidden" id="checkTotalTone" name="totalTone">
								</div>
							</div>
							<div class="form-group">
								<label for="wallColor">벽컬러</label>
								<div class="input-group">
									<c:forEach begin="0" end="12" var="i">
										<input type="radio" class="form-control myCheck wall" id="wallColor${i}">
									</c:forEach>
									<input type="hidden" id="checkWallColor" name="wallColor">
								</div>
							</div>
							<div class="form-group">
								<label for="bottomColor">바닥컬러</label>
								<div class="input-group">
									<c:forEach begin="0" end="12" var="i">
										<input type="radio" class="form-control myCheck bottom" id="bottomColor${i}">
										<input type="hidden" id="checkBottomColor" name="bottomColor">
									</c:forEach>
								</div>
							</div>
							<div class="form-group">
								<label for="detail">세부공사</label>
								<div class="dropdown">
									<button class="btn btn-outline-secondary dropdown-toggle"
										type="button" id="dropdownMenu2" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false">선택해주세요.</button>
									<div class="dropdown-menu detail">
										<input class="dropdown-item detailOption" type="button" value="헤링본 마루"> 
										<input class="dropdown-item detailOption" type="button" value="대리석 바닥"> 
										<input class="dropdown-item detailOption" type="button" value="원목마루">
										<input class="dropdown-item detailOption" type="button" value="포세린타일"> 
										<input class="dropdown-item detailOption" type="button" value="폴리싱타일"> 
										<input class="dropdown-item detailOption" type="button" value="주방리모델링"> 
										<input class="dropdown-item detailOption" type="button" value="조명시공">
										<input class="dropdown-item detailOption" type="button" value="폴딩도어"> 
										<input class="dropdown-item detailOption" type="button" value="중문">
										<input class="dropdown-item detailOption" type="button" value="가벽&파티션"> 
										<input class="dropdown-item detailOption" type="button" value="슬라이딩도어"> 
										<input class="dropdown-item detailOption" type="button" value="아트월">
										<input class="dropdown-item detailOption" type="button" value="발코니확장">
									</div>
								</div>
								<div id="detail">
									<!-- dropdown 버튼 클릭시 버튼 추가, 삭제 -->
								</div>
							</div>
							<div class="form-group">
								<label for="link">링크</label> 
								<input type="text" class="form-control myCheck" id="link" name="link">
							</div>
							<div class="form-group">
								<label for="copyright">저작권표기(C)</label> 
								<input type="text" class="form-control myCheck" id="copyright" name="copyright">
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="form-group">
				<div class="jumbotron mt-3">
					<p class="lead">추가하기 버튼으로 커버 사진을 업로드 해주세요.</p>
					<input type="file" name="file" onchange="fileCheck(this)" accept="image/gif, image/jpeg, image/png">
				</div>
			</div>
			<div class="form-group">
				<label for="title">Title:</label> 
				<input type="text" class="form-control myCheck" id="title" name="title">
			</div>
			<div class="form-group">
				<label for="contents">Contents:</label>
				<!-- <div class="note-btn-group btn-group note-insert">
					<button type="button" class="note-btn btn btn-default btn-sm" tabindex="-1" title="" aria-label="Link (⌘+K)" data-original-title="Link (⌘+K)">
						<i class="note-icon-link"></i>
					</button>
					<button type="file" class="note-btn btn btn-default btn-sm" tabindex="-1" title="" aria-label="Picture" data-original-title="Picture">
						<i class="note-icon-picture"></i>
					</button>
				</div> -->
				<input class="form-control myCheck contents" id="summernote"
					name="contents">
				<!-- <textarea class="form-control myCheck" rows="5" id="contents" name="contents"></textarea> -->
			</div>

			<div class="form-group" hidden="hidden">
				<input type="text" class="form-control myCheck" id="username" name="username" value="${vo.username}">
			</div>

			<div>
				<button type="submit" class="btn btn-outline-primary">WRITE</button>
			</div>
		</form>
	</div>

	<c:import url="../template/footer.jsp"></c:import>

	<div id="sample" hidden="hidden">
		<div>
			<a class="btn btn-primary delete" type="button"></a>
		</div>
	</div>


	<script type="text/javascript" src="/js/hwInsert.js"></script>

</body>
</html>