<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.fakeimg {
	height: 200px;
	background: #aaa;
}
</style>

</head>
<body>
	<div class="container">

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
								      <input class="dropdown-item fmtOption" type="button" value="싱글라이프">
								      <input class="dropdown-item fmtOption" type="button" value="신혼부부">
								      <input class="dropdown-item fmtOption" type="button" value="아기가 있는 집">
								      <input class="dropdown-item fmtOption" type="button" value="취학 자녀가 있는 집">
								      <input class="dropdown-item fmtOption" type="button" value="부모님과 함께 사는 집">
								      <input class="dropdown-item fmtOption" type="button" value="기타">
								    </div>
								</div>
								
								<div id="fmt">
									<!-- dropdown 버튼 클릭시 버튼 추가, 삭제 -->
								</div>
								
							</div>
							
							<div class="form-group">
								<label for="area">지역</label> 
								<input type="text" class="form-control myCheck" id="area" name="area">
							</div>
							<div class="form-group">
								<label for="style">스타일</label> 
								<input type="text" class="form-control myCheck" id="style" name="style">
							</div>
							<div class="form-group">
								<label for="period">기간</label> 
								<input type="text" class="form-control myCheck" id="period" name="period">
							</div>
							<div class="form-group">
								<label for="budget">예산</label> 
								<input type="text" class="form-control myCheck" id="budget" name="budget">
							</div>
							<div class="form-group">
								<label for="totalTone">전체톤</label> 
								<input type="text" class="form-control myCheck" id="totalTone" name="totalTone">
							</div>
							<div class="form-group">
								<label for="wallColor">벽컬러</label> 
								<input type="text" class="form-control myCheck" id="wallColor" name="wallColor">
							</div>
							<div class="form-group">
								<label for="bottomColor">바닥컬러</label> 
								<input type="text" class="form-control myCheck" id="bottomColor" name="bottomColor">
							</div>
							<div class="form-group">
								<label for="detail">세부공사</label>
								<input type="text" class="form-control myCheck" id="detail" name="detail">
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
				    <input type="file" name="file">
				</div>
			</div>
			<div class="form-group">
				<label for="title">Title:</label> 
				<input type="text" class="form-control myCheck" id="title" name="title">
			</div>
			<div class="form-group">
				<label for="contents">Contents:</label>
				<textarea class="form-control myCheck" rows="5" id="contents" name="contents"></textarea>
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
	
	<div id="sampleFmt">
		<div>
			<input class="btn btn-primary delete" id="fmtBtn" type="button">
		</div>
	</div>
	
	
	<script type="text/javascript" src="/js/hwInsert.js"></script>

</body>
</html>