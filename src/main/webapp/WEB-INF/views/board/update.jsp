<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/se2/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
function editor2content() {
	editors[0].exec('UPDATE_CONTENTS_FIELD',[]);
	document.myform.submit();
}
</script></head>
<body>
<form method="post">
<table>
	<caption>게시물 글수정</caption>
<tr>
	<th>번호</th>
	<td>${articleVO.art_no}<input type="hidden" name="art_no" value="${articleVO.art_no}" /></td>
</tr>	
<tr>
	<th>제목</th>
	<td><input type="text" name="art_title" value="${articleVO.art_title}" autofocus="autofocus" style="width:645px" /></td>
</tr>	
<tr>
	<th>내용</th>
	<td><textarea name="art_content" id="art_content" style="width:645px;height:230px">${articleVO.art_content}</textarea>

	
	</td>
</tr>	
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="입력 완료"/>
</tr>	
</table>
</form>
</body>
</html>