<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>IBM Emp: Home</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
    <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
        <td><h3>IBM Emp: Home</h3><font color=red>( MVC )</font></td>
    </tr>
</table>

<p>This is the Home page for IBM Emp: Home</p>

<h3>資料查詢:</h3>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
    <font color='red'>請修正以下錯誤:
        <ul>
            <c:forEach var="message" items="${errorMsgs}">
                <li>${message}</li>
            </c:forEach>
        </ul>
    </font>
</c:if>

<ul>
    <li><a href='<%=request.getContextPath()%>/emp/listAllEmp.jsp'>List</a> all Emps.</li>
    <br><br>

    <li>
        <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do">
            <b>輸入員工編號 (如7001):</b>
            <input type="text" name="empno">
            <input type="submit" value="送出">
            <input type="hidden" name="action" value="getOne_For_Display">
        </FORM>
    </li>

    <jsp:useBean id="empSvc" scope="page" class="com.emp.model.EmpService"/>

    <li>
        <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do">
            <b>選擇員工編號:</b>
            <select size="1" name="empno">
                <c:forEach var="empVO" items="${empSvc.all}">
                <option value="${empVO.empno}">${empVO.empno}
                    </c:forEach>
            </select>
            <input type="submit" value="送出">
            <input type="hidden" name="action" value="getOne_For_Display">
        </FORM>
    </li>

    <li>
        <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do">
            <b>選擇員工姓名:</b>
            <select size="1" name="empno">
                <c:forEach var="empVO" items="${empSvc.all}">
                <option value="${empVO.empno}">${empVO.ename}
                    </c:forEach>
            </select>
            <input type="submit" value="送出">
            <input type="hidden" name="action" value="getOne_For_Display">
        </FORM>
    </li>


    <jsp:useBean id="aaSvc" scope="page" class="com.admin.model.Admin_AuthorityService"/>

    <li>
        <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/dept/dept.do">
            <b><font color=orange>選擇部門:</font></b>
            <select size="1" name="deptno">
                <c:forEach var="deptVO" items="${aaSvc.all}">
                <option value="${aaSvc.dname}">${aaSvc.dname}
                    </c:forEach>
            </select>
            <input type="submit" value="送出">
            <input type="hidden" name="action" value="listEmps_ByDeptno_A">
        </FORM>
    </li>
</ul>

<%-- 萬用複合查詢-以下欄位-可隨意增減 --%>
<ul>
    <li>
        <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/af.do" name="form1">
            <p color=blue>萬用複合查詢:</p>
            <label for="auth_no">輸入員工編號:</label>
            <input type="text" name="auth_no" id="auth_no" value="7001"><br>

            <labelb for="auth_name">輸入員工姓名:</labelb>
            <input type="text" name="auth_name" id="auth_name" value="權限名稱"><br>


            <input type="submit" value="送出">
            <input type="hidden" name="action" value="listEmps_ByCompositeQuery">
        </FORM>
    </li>
</ul>


<h3>員工管理</h3>

<ul>
    <li><a href='<%=request.getContextPath()%>/emp/addEmp.jsp'>Add</a> a new Emp.</li>
</ul>

<h3 color=orange>部門管理</h3>

<ul>
    <li><a href='<%=request.getContextPath()%>/dept/listAllDept.jsp'>List</a> all Depts.</li>
</ul>

</body>

</html>
