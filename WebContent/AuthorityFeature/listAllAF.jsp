<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.admin.model.*" %>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    // EmpService empSvc = new EmpService();
// List<EmpVO> list = empSvc.getAll();
// pageContext.setAttribute("list",list);
%>
<jsp:useBean id="authority_FeatureSvc" scope="page" class="com.admin.model.Authority_FeatureService"/>

<html>
<head>
    <title>�Ҧ����� - listAllAF.jsp</title>
</head>
<body bgcolor='white'>


<h3>�Ҧ����� - ListAllAF.jsp</h3>
<h3><a href="<%=request.getContextPath()%>/select_page.jsp">
    <img src="images/babeq3.png" width="100" height="32"
         border="0">�^����</a></h3>


<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
    <ul color='red'>
        �Эץ��H�U���~:
        <c:forEach var="message" items="${errorMsgs}">
            <li>${message}</li>
        </c:forEach>
    </ul>
</c:if>

<table border='1' bordercolor='#CCCCFF' width='800'>
    <tr>
        <th>�v���s��</th>
        <th>�v���W��</th>

        <th>�ק�</th>
        <th color=red>�R��(���p���ջP���-�p��)</th>
        <th>�d�߳������u</th>
    </tr>

    <c:forEach var="authority_FeatureVO" items="${authority_FeatureSvc.all}">
        <tr align='center' valign='middle'>
            <td>${authority_FeatureVO.auth_no}</td>
            <td>${authority_FeatureVO.auth_name}</td>
            <td>
                <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/AuthorityFeatureServlet.do">
                    <input type="submit" value="�ק�" disabled="true">
                    <input type="hidden" name="deptno" value="${authority_FeatureVO.auth_no}">
                    <%--<input type="hidden" name="action" value="getOne_For_Update_Dept">--%>
                </FORM>
            </td>
            <td>
                <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/AuthorityFeatureServlet.do">
                    <input type="submit" value="�R��">
                    <input type="hidden" name="auth_no" value="${authority_FeatureVO.auth_no}">
                    <input type="hidden" name="action" value="deleteAF">
                </FORM>
            </td>
            <td>
                <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/AuthorityFeatureServlet.do">
                    <input type="submit" value="�e�X�d��">
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
