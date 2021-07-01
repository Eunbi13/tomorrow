<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="../template/bootStrap.jsp"></c:import>
	<c:import url="../template/hwSummernote.jsp"></c:import>
	<link rel="stylesheet" type="text/css" href="/css/common.css">
	<link rel="stylesheet" type="text/css" href="/css/header.css">
<script type="text/javascript" src="/js/header.js"></script>
	<!-- summernote
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script> -->
	<title>내일부터 하는 인테리어, 내일의 집</title>
	<style>
	.fakeimg {
		height: 200px;
		background: #aaa;
	}
	.editor-top-sub-section {
	    border-bottom: 1px solid #eaebef;
	}
	.editor-top-sub-section-header {
	    display: -webkit-box;
	    display: -webkit-flex;
	    display: -moz-flex;
	    display: -ms-flexbox;
	    display: flex;
	    -webkit-box-align: center;
	    -ms-flex-align: center;
	    -webkit-align-items: center;
	    -moz-align-items: center;
	    align-items: center;
	    width: 100%;
	    margin: 0;
	    padding: 17px 5px;
	    border: none;
	    background: none;
	    font: inherit;
	    box-sizing: border-box;
	    text-align: left;
	    transition: background-color .1s;
	    border-radius: 4px;
	}
	
	@media (min-width: 768px)
	.editor-top-sub-section {
	    margin: 16px 0;
	    border-radius: 4px;
	    border: 1px solid #dadce0;
	    background-color: #fff;
	    box-shadow: 0 2px 4px 0 rgb(234 235 239 / 80%);
	}
	.editor-top-sub-section-header {
	    padding: 25px 30px;
	}
	</style>

</head>
<body>
	<!-- <nav class="navbar navbar-expand-md navbar-light fixed-top bg-light">
		<a href="/">
				<img class="logo" src="/images/logo.PNG"  alt="내일의집 로고">
			</a>

		<div class="collapse navbar-collapse" id="navbarCollapse">

		</div>
	</nav> -->
	<header>
		<div class="mainNav">
			<div class="mainNav-item">
				<a href="/">
					<img class="logo" src="/images/logo.PNG"  alt="내일의집 로고">
				</a>
			</div>
		</div>
	</header>

	<div class="container" style="margin-top: 100px">
		<div class="accordion">
		<div class="card">
		<div class="editor-top-sub-section">
			<button class="editor-top-sub-section-header card-head" type="button" id="id-163-header" aria-labelledby="id-163 -content" aria-expanded="true">
				<div class="editor-top-sub-section-header__left">
					<div class="editor-top-sub-section-header__icon">
						<svg class="icon" width="25" height="25" viewBox="0 0 25 25" preserveAspectRatio="xMidYMid meet">
							<rect width="25" height="25" fill="#6ADFC4" rx="10"></rect>
							<g fill="#FFF" transform="translate(7 8)">
								<rect width="7" height="1.5" rx=".8"></rect>
								<rect width="11" height="1.5" y="4" rx=".8"></rect>
								<rect width="11" height="1.5" y="8" rx=".8"></rect>
							</g>
						</svg>
					</div>
					<div class="editor-top-sub-section-header__title">집들이 작성 가이드</div>
					<div class="editor-top-sub-section-header__sub-title">원활한 집들이 발행을 위해 꼭 읽어주세요.</div>
				</div>
				
				<div class="editor-top-sub-section-header__right">
					<svg class="editor-top-section-expand-icon editor-top-section-expand-icon--open" width="1em" height="1em" viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet">
						<path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z"></path>
					</svg>
				</div>
			</button>
			
			<div class="open expanded" style="overflow: hidden;">
				<div class="editor-top-sub-section-content" role="region" id="id-163 -content" aria-labelledby="id-163-header">
					<ul class="editor-top-guide-section">
						<li>에디터의 섭외 없이 작성해주시는 경우엔 확인 후 <b>게시글 오픈이 반려될 수도 있습니다.</b>&nbsp;오픈 및 반려 여부는 <b>댓글로</b> 안내 드립니다.</li>
						<li>오픈 및 반려 여부 확인은 작성해주신 시점을 기준으로 일주일-10일 가량 소요되며,&nbsp;<b>댓글로</b> 결과를 안내 드립니다.</li><li>간단한 자기 소개 후 집에 관한 이야기를 들려주세요. (집 공간 사진 최소 15장 이상)</li>
						<li>집 사진/소개글 관련해서 고민이 될 땐 이 링크를 참고해주세요 (<a href="https://www.notion.so/c80cebb1522d4491b76c23de07cb4b5b" target="_blank" rel="noopener noreferrer">https://www.notion.so/c80cebb1522d4491b76c23de07cb4b5b</a>)</li>
						<li>도면이 있으면 좋아요. (손그림도 OK)</li>
						<li>사진 속 제품 정보를 본문에 최대한 적어주세요. (제품분류/브랜드/제품명 순서)</li>
						<li>사진 첨부 시 용량은 장당 최대 20MB까지 업로드할 수 있고, jpg, png, webp, heif, heic, gif 포맷을 지원합니다.</li>
						<li>정보를 많이 입력할수록 검색 결과에 많이 노출되어 조회수가 올라갑니다.</li><li>커버사진과 제목은 에디터에 의해 변경될 수 있습니다.</li>
					</ul>
				</div>
			</div>
			</div>
			</div>
		</div>

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
									<option disabled="disabled" selected="selected">선택해주세요.</option>
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
									<option disabled="disabled" selected="selected">선택해주세요.</option>
									<option>리모델링</option>
									<option>홈스타일링</option>
									<option>부분공사</option>
									<option>건축</option>
								</select>
							</div>
							<div class="form-group">
								<label for="familyType">가족형태</label>
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
									<ul class="fmtUl">
										<!-- dropdown 버튼 클릭시 버튼 추가, 삭제 -->
									</ul>
									<input type="text" class="form-control myCheck checkFamilyType" id="familyType" name="familyType" hidden="hidden">
								</div>

							</div>

							<div class="form-group">
								<label for="area">지역</label>
								<select class="form-control myCheck" id="area" name="area">
									<option disabled="disabled" selected="selected">선택해주세요.</option>
									<option>서울특별시</option>
									<option>부산광역시</option>
									<option>대구광역시</option>
									<option>인천광역시</option>
									<option>광주광역시</option>
									<option>대전광역시</option>
									<option>울산광역시</option>
									<option>강원도</option>
									<option>경기도</option>
									<option>경상남도</option>
									<option>경상북도</option>
									<option>전라남도</option>
									<option>전라북도</option>
									<option>충청남도</option>
									<option>충청북도</option>
									<option>세종특별자치시</option>
									<option>제주특별자치도</option>
								</select>
							</div>
							
							<div class="form-group">
								<label for="style">스타일</label>
								<div class="dropdown">
									<button class="btn btn-outline-secondary dropdown-toggle" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										선택해주세요.
									</button>
									<div class="dropdown-menu style">
										<a class="dropdown-item styleOption" type="button">모던</a>
										<a class="dropdown-item styleOption" type="button">미니멀/심플</a>
										<a class="dropdown-item styleOption" type="button">내추럴</a>
										<a class="dropdown-item styleOption" type="button">북유럽</a>
										<a class="dropdown-item styleOption" type="button">빈티지/레트로</a>
										<a class="dropdown-item styleOption" type="button">클래식/앤틱</a>
										<a class="dropdown-item styleOption" type="button">프렌치/프로방스</a>
										<a class="dropdown-item styleOption" type="button">러블리/로맨틱</a>
										<a class="dropdown-item styleOption" type="button">인터스트리얼</a>
										<a class="dropdown-item styleOption" type="button">한국/아시아</a>
										<a class="dropdown-item styleOption" type="button">유니크/믹스매치</a>
									</div>
								</div>
								<div id="stt">
									<ul class="sttUl">
										<!-- dropdown 버튼 클릭시 버튼 추가, 삭제 -->
									</ul>
									<input type="text" class="form-control myCheck checkStyle" id="style" name="style" hidden="hidden">
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
									<button class="btn btn-outline-secondary dropdown-toggle" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										선택해주세요.
									</button>
									<div class="dropdown-menu detail">
										<a class="dropdown-item detailOption" type="button">헤링본 마루</a>
										<a class="dropdown-item detailOption" type="button">대리석 바닥</a>
										<a class="dropdown-item detailOption" type="button">원목마루</a>
										<a class="dropdown-item detailOption" type="button">포세린타일</a>
										<a class="dropdown-item detailOption" type="button">폴리싱타일</a>
										<a class="dropdown-item detailOption" type="button">주방리모델링</a>
										<a class="dropdown-item detailOption" type="button">조명시공</a>
										<a class="dropdown-item detailOption" type="button">폴딩도어</a>
										<a class="dropdown-item detailOption" type="button">중문</a>
										<a class="dropdown-item detailOption" type="button">가벽&파티션</a> 
										<a class="dropdown-item detailOption" type="button">슬라이딩도어</a>
										<a class="dropdown-item detailOption" type="button">아트월</a>
										<a class="dropdown-item detailOption" type="button">발코니확장</a>
									</div>
								</div>
								
								<div id="dtt">
									<ul class="dttUl">
										<!-- dropdown 버튼 클릭시 버튼 추가, 삭제 -->
									</ul>
									<input type="text" class="form-control myCheck checkDetail" id="detail" name="detail" hidden="hidden">
								</div>
							</div>
							<div class="form-group">
								<label for="link">링크</label> 
								<input type="text" class="form-control myCheck" id="link" name="link" placeholder="URL 주소를 입력해주세요.">
							</div>
							<div class="form-group">
								<label for="copyright">저작권표기(C)</label> 
								<input type="text" class="form-control myCheck" id="copyright" name="copyright" placeholder="사진 저작자를 입력해주세요.">
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="form-group">
				<div class="jumbotron mt-3">
					<div class="col-sm-10">
						<p class="lead">추가하기 버튼으로 커버 사진을 업로드 해주세요.</p>
						<input type="file" name="file" onchange="fileCheck(this)" accept="image/gif, image/jpeg, image/png">
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="title">Title:</label> 
				<input type="text" class="form-control myCheck" id="title" name="title" placeholder="제목을 입력해주세요.">
			</div>
			<div class="form-group">
				<label for="contents">Contents:</label>
				<textarea class="form-control myCheck" rows="5" id="hwSummernote" name="contents"></textarea>
			</div>

			<div class="form-group" hidden="hidden">
				<input type="text" class="form-control myCheck" id="username" name="username" value="${vo.username}">
			</div>

			<div>
				<button type="submit" class="btn btn-outline-primary">발행신청</button>
			</div>
		</form>
	</div>

	<c:import url="../template/footer.jsp"></c:import>

	<div id="sample" hidden="hidden">
		<li>
			<input class="btn btn-primary delete" type="button">
		</li>
	</div>


	<script type="text/javascript" src="/js/hwInsert.js"></script>
	<script type="text/javascript" src="/js/summerFile.js"></script>

</body>
</html>