<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="vo" value="${articleVO}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/xhr.js"></script>
<script type="text/javascript">
var goodbad_count;
var type;

function confirm_delete() {
	if(confirm('정말로 삭제하시겠습니꺄?')) {
		location.href='delete';
	}	
}

function goodbad(t) {
	type = t;
	new ajax.xhr.Request('goodbad', 'type=' + type + '&no=${vo.art_no}', callback, 'POST');
}

function callback(xhr) {
	if (xhr.readyState == 4) {
		if (xhr.status == 200) {
			goodbad_count = parseInt(xhr.responseText.trim());
			if (goodbad_count === -1) {
				alert('이미 추천/비추천 하였습니다.');
				return;
			} else if (type === 'g'){
				document.getElementById('good_count').innerHTML = goodbad_count;
				return;
			} else if (type === 'b') {
				document.getElementById('bad_count').innerHTML = goodbad_count;
				return;
			} else {
				alert('시스템 오류입니다~!!!!');
				return;
			}
		}
	}
}
window.onload = function() {
	document.getElementById('good').onclick = function() {
		goodbad('g');
	}	
	document.getElementById('bad').onclick = function() {
		goodbad('b');
	}	
}
</script>
</head>
<body>
<table>
	<caption>게시물 상세보기</caption>
<tr>
	<th>글번호</th>
	<td>${vo.art_no}</td>
</tr>
<tr>
	<th>제목</th>
	<td>${vo.art_title}</td>
</tr>
<tr>
	<th>작성자</th>
	<td>${vo.userVO.usr_name}(${vo.userVO.usr_id})</td>
</tr>
<tr>
	<th>작성일</th>
	<td><fmt:formatDate value="${vo.art_regdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
</tr>
<tr>
	<th>조회수</th>
	<td>${vo.art_readcnt}</td>
</tr>
<tr>
	<th>내용</th>
	<td>${vo.art_content}</td>
</tr>
<tr>
	<th>추천</th>
	<td><span id="good_count">${vo.art_like}</span><img src="${app}/resources/img/good.png" id="good" /></td>
</tr>
<tr>
	<th>비추천</th>
	<td><span id="bad_count">${vo.art_dislike}</span><img src="${app}/resources/img/bad.png" id="bad" /></td>
</tr>
<tr>
	<th>작성자ip</th>
	<td>${vo.art_ip}</td>
</tr>
<tr>
	<td colspan="2">
		<a href="../">[리스트]</a>
		<c:if test="${vo.userVO.usr_id == sessionScope.userInfo.usr_id}">
			<a href="update?no=${vo.art_no}">[수정]</a>
			<a href="javascript:;" onclick="confirm_delete()">[삭제]</a>
		</c:if>
	</td>
</tr>
<tr>
	<td colspan="2">
	<table>
		<tr>
			<td>
			
				<textarea id="c_content" name="c_content" style="width:400px;height:60px;"></textarea><br/>
				<input type="button" value="댓글등록"  />
			</td>
		</tr>
	</table>
	</td>
</tr>


</table><br/>
</body>
</html>