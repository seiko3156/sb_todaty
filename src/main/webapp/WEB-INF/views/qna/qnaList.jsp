<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file= "../include/headerfooter/header.jsp"%>
<%@ include file="qna_sub_menu_left.jsp" %>

<script>

function checkPass( qseq ){
	var url = "qtest.do?command=passForm&qseq=" + qseq;
	var opt = "toolbar=no, menubar=no, scrollbars=no, resizable=no, width=500, height=300";
	window.open(    url,   'checkPassword' ,   opt);
}

</script>


<article>
	<h2 class="pt-3 pb-3 mt-3 mb-3" align="center"> 고객 게시판</h2>
	<h5 class="pt-3 pb-3 mt-3 mb-3"> 궁금하신 사항은 언제든지 문의하세요 </h5>
	<form name="formm" method="post" >
		<table id="qnaListTable" style="width:100%;">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>등록일</th>
				<th>답변 여부</th>
			</tr>
			<c:forEach items="${qnaList}" var="qnaVO">
				<tr>
					<td>${qnaVO.QSEQ}</td>				
					<c:choose>
						<c:when test="${qnaVO.SECRET=='0'}">
							<td><a href="qnaDetail?qseq=${qnaVO.QSEQ}&refer=q">${qnaVO.QSUBJECT}</a></td>
						</c:when>
						<c:otherwise>
							<td><a href="#" onclick="pwdcheck(${qnaVO.QNAPASS},${qnaVO.QSEQ},'q')">${qnaVO.QSUBJECT}
							<img src="image/key1.png" style="width:13px vertical-align:middle;"></a></td>
						</c:otherwise>					
					</c:choose>
						
					<td><fmt:formatDate value="${qnaVO.QNADATE}" type="date" /></td>
					<td>
						<c:choose>
						 	<c:when test="${qnaVO.REP==1}">no</c:when>
						 	<c:when test="${qnaVO.REP==2}">yes</c:when>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</table>
<jsp:include page="../paging/paging.jsp">
   <jsp:param name="command" value="qnaList"/>
</jsp:include>
</form>
</article>	


<%@ include file= "../include/headerfooter/footer.jsp"%>