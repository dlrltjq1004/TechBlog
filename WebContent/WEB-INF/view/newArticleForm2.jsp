<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 작성</title>
<link href="../Resource/css/freelancer.min.css" rel="stylesheet">

<!-- 스마트 에디터  -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/SE2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<!-- 사진 퀵 업로더 -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/SE2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
	charset="utf-8"></script>

</head>


<style>
#selet-box1 {
	width: 155px;
	height: 45px;
	text-align: center;
}

#selet-box2 {
	width: 155px;
	height: 45px;
	text-align: center;
}

#textbox-title {
	width: 1000px;
	height: 45px;
	text-align: left;

}

#textbox-content {
	margin-top: 15px;
	width: 911px;
	height: 500px;
}

* {
	margin: 0;
	padding: 0;
}

/* body {
	width: 2000px;
	margin: 0px auto;
} */

/* input file type */
.input-file {
	display: inline-block;
}

.input-file [type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0 none;
}

.input-file .file-label {
	display: inline-block;
	border: none;
	min-width: 53px;
	height: 27px;
	line-height: 24px;
	padding: 5px 8px;
	border-radius: 2px;
	font-size: 14px;
	background-color: #333;
	color: #fff;
	text-align: center;
	text-decoration: none;
	height: 35px
}

.input-file .file-name {
	width: 1130px;
	height: 50px;
	background: #f5f5f5;
	height: 27px;
	line-height: 26px;
	text-indent: 5px;
	border: 1px solid #bbb;
	height: 35px
} /* 접근성 탭 포커스 스타일 */
.file-focus {
	outline: 1px dotted #d2310e;
}
</style>

<body>

	<form id="frm" action="write.do"  method="post" enctype="multipart/form-data">
		<div>
			<div id="NavigationBar">
				<jsp:include page="../include/navigationBar.jsp" />
			</div>

			<div class="post-container"
				style="margin-top: 200px; margin-left: 120px;">

				<div class="post-top">
					<img class="post border_color img-1"
						src="../Resource/img/post/border_color.PNG" width="43" height="43"
						align="left" style="padding-top: 3px;">
					<h4 style="text-align: left; padding-bottom: ; padding-left: 3px;">게시물
						작성</h4>
				</div>

				<div class="categort-title-write" id="select-box"
					style="text-align: left; margin-top: 35px;">
					<select name="category" class="custom-select custom-select-sm" id="selet-box1" >
						<option selected>카테고리</option>
						<option value="공부로그">공부로그</option>
						<option value="프로젝트">프로젝트</option>
					</select> 
					<select name="category2" class="custom-select custom-select-sm" id="selet-box2" style="margin-left: 3px">
						<option selected>카테고리2</option>
						<option value="웹개발">웹개발</option>
						<option value="게임개발">게임개발</option>
					</select> 
					
					    <input name="title" type="text" id="input-title" class="form-control" aria-describedby="" placeholder="제목"
						style="width: 890px; height: 45px; position: relative; bottom: 45px; left: 330px;">

				</div>
				<div>
					<textarea name="smarteditor"  id="smarteditor" rows="10" cols="100"
						style="margin-top: 10px;"></textarea>

				</div>
				<br>
				<div class="input-file">
			
					<input type="text" name="file-name" readonly="readonly" 
						class="file-name" /> <label for="upload01" class="file-label">파일업로드</label>
					<input type="file" name="representative_image" id="upload01"
						class="file-upload" />
				</div>
			
			<!-- <div class="input-file">
			
					<input type="text" name="file-name2" readonly="readonly" placeholder="프로젝트 시연 영상 업로드"
						class="file-name" /> <label for="upload01" class="file-label">파일업로드</label>
					<input type="file" name="representative_image2" id="upload01"
						class="file-upload" />
				</div> -->
			</div>
		</div>
			<input id="savebutton" type="button" value="등록하기" class="btn btn-secondary" onClick="doSubmit()" 
						style="width: 150px; height: 60px; left: 0; right: 0; margin-top: 20px; margin-left: 630px;">
	</form>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>

<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "smarteditor",
		sSkinURI : "<%=request.getContextPath()%>/SE2/SmartEditor2Skin.html",
		fCreator : "createSEditor2",
		htParams : { fOnBeforeUnload : function(){} } // popup 창 안뜨게 하는 코드

		
	});
	
	 function doSubmit() {
			
			frm.action = "write.do";
			/* frm.encoding = "application/x-www-form-urlencoded"; */ 
			oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []); 
			
			frm.submit();
		} 
	
	
			
		

		
		
		

	// textArea에 이미지 첨부
<%-- 	function pasteHTML(filepath){
	    var sHTML = '<img src="<%=request.getContextPath()%>/Resource/img/uploade/'+ filepath + '">';
		oEditors.getById["ir1"].exec("PASTE_HTML", [ sHTML ]);
		
	
	} --%>
	
</script>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	(function($) {
		var $fileBox = null;
		$(function() {
			init();
		})
		function init() {
			$fileBox = $('.input-file');
			fileLoad();
		}
		function fileLoad() {
			$.each($fileBox, function(idx) {
				var $this = $fileBox.eq(idx), $btnUpload = $this
						.find('[type="file"]'), $label = $this
						.find('.file-label');
				$btnUpload
						.on('change',
								function() {
									var $target = $(this), fileName = $target
											.val(), $fileText = $target
											.siblings('.file-name');
									$fileText.val(fileName);
								})
				$btnUpload.on('focusin focusout', function(e) {
					e.type == 'focusin' ? $label.addClass('file-focus')
							: $label.removeClass('file-focus');
				})
			})
		}
	})(jQuery);
</script>

<!-- <script>
 function doSubmit() {
	
	frm.action = "write.do";
	/* frm.encoding = "application/x-www-form-urlencoded"; */ 
	frm.submit();
} 
</script> -->


</html>