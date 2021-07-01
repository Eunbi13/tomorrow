<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <!-- include libraries(jQuery, bootstrap) -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {

				var toolbar = [
						// 글자 크기
						['fontsize', ['fontsize']],
						// 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
						[
								'style',
								[ 'bold', 'italic', 'underline',
										'strikethrough', 'clear' ] ],
						// 글자색
						[ 'color', [ 'forecolor'] ],
						// 글머리 기호, 번호매기기, 문단정렬
						[ 'para', [ 'ul', 'ol' ] ],
						// 그림첨부, 링크만들기
						[ 'insert', [ 'picture', 'link' ] ], 
					];

				var setting = {
					placeholder: '내용을 입력해주세요.',
					tabsize: 2,
					toolbar : toolbar
				};

				$('#hwSummernote').summernote(setting);
			});
</script>