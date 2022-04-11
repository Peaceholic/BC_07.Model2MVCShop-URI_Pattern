<%@ page contentType="text/html; charset=EUC-KR" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
<%@ page import="java.util.List"%>

<%@ page import="com.model2.mvc.common.Search"%>
<%@ page import="com.model2.mvc.common.Page"%>
<%@ page import="com.model2.mvc.common.util.CommonUtil"%>

<%@ page import="com.model2.mvc.service.domain.Purchase"%>
<%@ page import="com.model2.mvc.service.domain.User"%>

<%
User user = (User) session.getAttribute("user");
String menu = (String) request.getParameter("menu");

List<Purchase> list = (List<Purchase>) request.getAttribute("list");

Page resultPage = (Page) request.getAttribute("resultPage");
Search search = (Search) request.getAttribute("search");

//==> null �� ""(nullString)���� ����
String searchCondition = CommonUtil.null2str(search.getSearchCondition());
String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
%>

--%>
<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
function fncGetPurchaseList(currentPage) {
	document.getElementById("currentPage").value = currentPage;
   	document.detailForm.submit();	
}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/purchase/listPurchase" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage }
						������
					</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ȭ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	<%--
		int no=list.size();
		for(int i=0;i<list.size();i++){
			Purchase purchase = list.get(i);
	--%>
	<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}">
	<c:set var="i" value="${ i+1 }" />
	
	<tr class="ct_list_pop">
		<td align="center">
			<a href="/purchase/getPurchase?tranNo=${purchase.tranNo}">${purchase.tranNo}</a>
		</td>
		<td></td>
		<td align="left">
			<a href="/purchase/getUsero?userId=${user.userId}">${user.userId}</a>
		</td>
		<td></td>
		<td align="left">${purchase.receiverName}</td>
		<td></td>
		<td align="left">${purchase.receiverPhone}</td>
		<td></td>
		<td align="left">����
				
				<%-- <%if(purchase.getTranCode().trim().equals("1")){%>
					���ſϷ�
				<%}else if(purchase.getTranCode().trim().equals("2")){	%>
					�����
				<%}else if(purchase.getTranCode().trim().equals("3")){	%>
					��ۿϷ�
				<%}%> --%>
		<c:choose>
			<c:when test="${purchase.tranCode == '1'}"> 
				���ſϷ�
			</c:when>
			<c:when test="${purchase.tranCode == '2'}"> 
				�����
			</c:when>				
			<c:otherwise>
				��ۿϷ�
			</c:otherwise>
		</c:choose>				
				���� �Դϴ�.</td>
		<td></td>
		<td align="left">
			<%-- if(purchase.getTranCode().trim().equals("2")){ %>
			<a href="/updateTranCode.do?tranNo=${purchase.tranNo}&tranCode=3">���ǵ���</a>
			<%} --%>
			<c:choose>
				<c:when test="${purchase.tranCode == '2'}"> 
					<a href="/purchase/updateTranCodeByTran?tranNo=${purchase.tranNo}&tranCode=3">���ǵ���</a>
				</c:when>
			</c:choose>
			
		</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	<%--
	}
	--%>
	</c:forEach>
</table>
			<!-- PageNavigation Start... -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center"><input type="hidden" id="currentPage"
						name="currentPage" value="" /> 
												
						<jsp:include page="../common/pageNavigatorPurchase.jsp"/>
					</td>
				</tr>
			</table>			
			<!-- PageNavigation End... -->
</form>

</div>

</body>
</html>