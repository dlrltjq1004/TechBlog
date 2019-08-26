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

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>


<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"
	type="text/javascript" language="javascript">	
</script>

<!--CDN방식-->
<script src="<%=request.getContextPath() %>/Resource/js/jquery.MultiFile.min.js?var=1" type="text/javascript" language="javascript">
	
</script>


<script>
	$(function() { // wait for page to load

		//[1] 2개까지만 업로드할수있도록 설정
		$('input.afile1').MultiFile(2);

		//[2] 업로드할수있는 파일수 제한 및 확장자 필터
		$('input.afile2').MultiFile({
			// 옵션 설정
			max : 2, //업로할수있는 최대 파일 갯수
			accept : 'jpg|png|gif' //허용할수있는 파일 확장자
		});

		$('input.afile3').MultiFile({
			max : 5, //업로드 최대 파일 갯수 (지정하지 않으면 무한대)
			accept : 'jpg|png|gif', //허용할 확장자(지정하지 않으면 모든 확장자 허용)
			maxfile : 1024, //각 파일 최대 업로드 크기
			maxsize : 3024, //전체 파일 최대 업로드 크기
			STRING : { //Multi-lingual support : 메시지 수정 가능
				remove : "제거", //추가한 파일 제거 문구, 이미태그를 사용하면 이미지사용가능
				duplicate : "$file 은 이미 선택된 파일입니다.",
				denied : "$ext 는(은) 업로드 할수 없는 파일확장자입니다.",
				selected : '$file 을 선택했습니다.',
				toomuch : "업로드할 수 있는 최대크기를 초과하였습니다.($size)",
				toomany : "업로드할 수 있는 최대 갯수는 $max개 입니다.",
				toobig : "$file 은 크기가 매우 큽니다. (max $size)"
			},
			
			list : "#afile3-list", //파일목록을 출력할 요소 지정가능

		
			
		//각각의 이벤트에 따라 스크립 처리를 할수있다.
		/*
		,onFileRemove: function(element, value, master_element) {
		  $('#afile3-list').append('<li>onFileRemove - ' + value + '</li>')
		},
		afterFileRemove: function(element, value, master_element) {
		  $('#afile3-list').append('<li>afterFileRemove - ' + value + '</li>')
		},
		onFileAppend: function(element, value, master_element) {
		  $('#afile3-list').append('<li>onFileAppend - ' + value + '</li>')
		},
		afterFileAppend: function(element, value, master_element) {
		  $('#afile3-list').append('<li>afterFileAppend - ' + value + '</li>')
		},
		onFileSelect: function(element, value, master_element) {
		  $('#afile3-list').append('<li>onFileSelect - ' + value + '</li>')
		},
		afterFileSelect: function(element, value, master_element) {
		  $('#afile3-list').append('<li>afterFileSelect - ' + value + '</li>')
		},
		onFileInvalid: function(element, value, master_element) {
		  $('#afile3-list').append('<li>onFileInvalid - ' + value + '</li>')
		},
		onFileDuplicate: function(element, value, master_element) {
		  $('#afile3-list').append('<li>onFileDuplicate - ' + value + '</li>')
		},
		onFileTooMany: function(element, value, master_element) {
		  $('#afile3-list').append('<li>onFileTooMany - ' + value + '</li>')
		},
		onFileTooBig: function(element, value, master_element) {
		  $('#afile3-list').append('<li>onFileTooBig - ' + value + '</li>')
		},
		onFileTooMuch: function(element, value, master_element) {
		  $('#afile3-list').append('<li>onFileTooMuch - ' + value + '</li>')
		}
		 */

		});

	});
	

</script>
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
			
					<input type="text" name="file-name" readonly="readonly" placeholder="대표 이미지 업로드"
						class="file-name" /> <label for="upload01" class="file-label">파일업로드</label>
					<input type="file" name="representative_image" id="upload01"
						class="file-upload" />
				</div>
				
				<br><br>
			
		<!-- 	<div class="input-file">
			
					<input type="text" id="file-name2" name="file-name" readonly="readonly" placeholder="프로젝트 시연 영상 업로드"
						class="file-name" /> 
						<label for="upload02" class="file-label">파일업로드</label>
					<input type="file" name="project_image" id="upload02"
						class="file-upload" />
				</div>
				
				<br><br><p style="font-size:25px; border:5px;">프로젝트 이미지 다중 업로드(5개 이상 필수 등록)</p>
				    <input type="file" class="afile3" name="multiImages" />
				    
 
<br>
   선택 파일 목록
  <div id="afile3-list" name="afile3-list" style="border:2px solid #c9c9c9; width:600px; height:250px; smin-height:50px;"></div>
 <br>
 <br>
 <input type="hidden" name="fileCount">
 <input type="hidden" name="fileName0">
 <input type="hidden" name="fileName1">
 <input type="hidden" name="fileName2">
 <input type="hidden" name="fileName3">
 <input type="hidden" name="fileName4"> -->
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
		 
		/*  alert(document.getElementsByName("category")[0].value); */
	/* 		
		 if(document.getElementsByName("category").value == "프로젝트") {
			 
			 var size = document.getElementsByName("fileNames").length;
	            
			    frm.fileCount.value = size;
				var arr = [];
				
				 for(var i =0; i < size; i++) {
					
					
				 arr.push(document.getElementsByName("fileNames")[i].innerHTML);
				} 
				
				if(size != 5) {
					alert("프로젝트 이미지를 5개 이상 등록해 주세요");
					return;
				}
				
				frm.fileName0.value = arr[0];
				frm.fileName1.value = arr[1];
				frm.fileName2.value = arr[2];
				frm.fileName3.value = arr[3];
				frm.fileName4.value = arr[4];  
				
		 }
		  */
		  
		  
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

<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
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
 function doUpload() {
     
	var size = document.getElementsByName("fileNames").length;

	var arr = [];
	
	 for(var i =0; i < size; i++) {
		
		
	 arr.push(document.getElementsByName("fileNames")[i].innerHTML);
	} 
	
	if(size != 5) {
		alert("프로젝트 이미지를 5개 이상 등록해 주세요");
		return;
	}
	
	form.fileName0.value = arr[0];
	form.fileName1.value = arr[1];
	form.fileName2.value = arr[2];
	form.fileName3.value = arr[3];
	form.fileName4.value = arr[4];
	
	form.action = "upload.jsp?fileCount="+size;
	form.method = "post";
	form.submit(); 
    	    
 }
 
 
</script> -->
</html>