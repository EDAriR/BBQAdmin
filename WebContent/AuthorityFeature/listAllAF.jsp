<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.admin.model.*" %>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    // EmpService empSvc = new EmpService();
// List<EmpVO> list = empSvc.getAll();
// pageContext.setAttribute("list",list);
%>
<jsp:useBean id="authority_FeatureSvc" scope="page" class="com.admin.model.Authority_FeatureService"/>

<html>
<head>
    <title>所有部門 - listAllAF.jsp</title>
</head>
<body bgcolor='white'>


<h3>所有部門 - ListAllAF.jsp</h3>
<h3><a href="<%=request.getContextPath()%>/select_page.jsp">
    <img src="images/babeq3.png" width="100" height="32"
         border="0">回首頁</a></h3>


<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
    <ul color='red'>
        請修正以下錯誤:
        <c:forEach var="message" items="${errorMsgs}">
            <li>${message}</li>
        </c:forEach>
    </ul>
</c:if>

<table border='1' bordercolor='#CCCCFF' width='800'>
    <tr>
        <th>權限編號</th>
        <th>權限名稱</th>

        <th>修改</th>
        <th color=red>刪除(關聯測試與交易-小心)</th>
        <th>查詢部門員工</th>
    </tr>

    <c:forEach var="authority_FeatureVO" items="${authority_FeatureSvc.all}">
        <tr align='center' valign='middle'>
            <td>${authority_FeatureVO.auth_no}</td>
            <td>${authority_FeatureVO.auth_name}</td>
            <td>
                <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/AuthorityFeatureServlet.do">
                    <input type="submit" value="修改" disabled="true">
                    <input type="hidden" name="deptno" value="${authority_FeatureVO.auth_no}">
                    <%--<input type="hidden" name="action" value="getOne_For_Update_Dept">--%>
                </FORM>
            </td>
            <td>
                <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/AuthorityFeatureServlet.do">
                    <input type="submit" value="刪除">
                    <input type="hidden" name="auth_no" value="${authority_FeatureVO.auth_no}">
                    <input type="hidden" name="action" value="deleteAF">
                </FORM>
            </td>
            <td>
                <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/AuthorityFeatureServlet.do">
                    <input type="submit" value="送出查詢">
                    <input type="hidden" name="auth_no" value="${authority_FeatureVO.auth_no}">
                    <input type="hidden" name="action" value="listAFs_ByAuth_No_B">
                </FORM>
            </td>
        </tr>
    </c:forEach>
</table>

<%if (request.getAttribute("listAFs_ByAuth_No") != null) {%>
<jsp:include page="listAFs_ByAuth_No.jsp"/>
<%} %>

</body>
</html>
