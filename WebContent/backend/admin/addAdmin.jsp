<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.admin.model.*" %>
<%@ page import="com.admin.controller.SerialNumGenerator" %>
<%
    AdminVO adminVO = (AdminVO) request.getAttribute("adminVO");
    SerialNumGenerator sng = new SerialNumGenerator();

%>

<html>
<head>
    <title>Login BBQ</title>
    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/admin/backend/assets/css/bootstrap.css" rel="stylesheet">
    <!--external css  ICON-->
    <link href="<%=request.getContextPath()%>/admin/backend/assets/font-awesome/css/font-awesome.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/admin/backend/assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/admin/backend/assets/js/gritter/css/jquery.gritter.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/admin/backend/assets/lineicons/style.css">
    <link href="<%=request.getContextPath()%>/admin/backend/assets/css/style-responsive.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/admin/backend/assets/css/table-responsive.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/admin/backend/assets/css/style.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/admin/backend/assets/css/style-responsive.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
    <font color='red'>�Эץ��H�U���~:
        <ul>
            <c:forEach var="message" items="${errorMsgs}">
                <li>${message}</li>
            </c:forEach>
        </ul>
    </font>
</c:if>
<%-- ���~��C --%>

<section id="container">

    <!-- **********************************************************************************************************************************************************
    MAIN SIDEBAR MENU
    *********************************************************************************************************************************************************** -->

    <!--sidebar start ������-->
    <aside>
        <div id="sidebar" class="nav-collapse ">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion">
                <p class="centered">
                    <a href="index.jsp">
                        <img src="img/babeq3.png" width="190">
                    </a>
                </p>
                <h5 class="centered" style="font-size: 24px;">
                    <a href="javascript:;">
                    <span style="color: #636363">
                        <i class="fa fa-sign-out" aria-hidden="true"></i>
                        ${adm_name}</span>
                    </a>
                </h5>

                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-desktop"></i>
                        <span>�|����ƺ޲z</span>
                    </a>
                    <ul class="sub">
                        <li><a href="member/member_expert.html">�M�a�f��</a></li>
                        <li><a href="member/member_grade.html">��`�����f��</a></li>
                        <li><a href="member/buyer_report.html">�R�a���|</a></li>
                        <li><a href="member/seller_reprot.html">��a���|</a></li>
                        <li><a href="member/product_report.html">�ӫ~���|</a></li>
                        <li><a href="member/product_message_report.html">�ӫ~�d�����|</a></li>
                        <li><a href="member/answer_report.html">�^�а��D���|</a></li>
                        <li><a href="member/article_message_report.html">�d�����|</a></li>
                        <li><a href="report.html">��ѫǥΤ����|</a></li>
                        <li><a href="panels.html">�|����ƺ޲z</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-car"></i>
                        <span>���˸�ƺ޲z</span>
                    </a>
                    <ul class="sub">
                        <li><a href="map.html">���˸�ƺ�</a></li>
                        <li><a href="todo_list.html">�ƭ��~</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>�����޲z</span>
                    </a>
                    <ul class="sub">
                        <li><a href="blank.html">�ʪ��Ϥ���</a></li>
                        <li><a href="backend/login.html">�峹����</a></li>
                        <li><a href="lock_screen.html">�ӫ~����</a></li>
                        <li><a href="lock_screen.html">���D����</a></li>
                        <li><a href="lock_screen.html">�M�a����</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="news.html">
                        <i class="fa fa-bell"></i>
                        <span>�̷s�����޲z</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class=" fa fa-legal"></i>
                        <span>���u�b��޲z</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class=" fa fa-database"></i>
                        <span>�t�ΰѼƺ޲z</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-bar-chart-o"></i>
                        <span>��x���R�޲z</span>
                    </a>
                </li>
            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>
    <!--sidebar end-->

    <!-- **********************************************************************************************************************************************************
    MAIN CONTENT  �o��}�l�� BBQ
    *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <h3><i class="fa fa-angle-right"></i> Form Components</h3>

            <!-- BASIC FORM ELELEMNTS -->
            <div class="row mt">
                <div class="col-lg-12">
                    <div class="form-panel">
                        <h4 class="mb"><i class="fa fa-angle-right"></i> Form Elements</h4>
                        <form class="form-horizontal style-form" method="post" action="AdminServlet.do">

                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">���u�m�W</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control round-form"
                                           name="adm_name" placeholder="placeholder"
                                           value="<%= (adminVO==null)? "�d�ç�" : adminVO.getAdm_name()%>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">���u�b��</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control round-form"
                                           name="adm_acct" placeholder="adcde123"
                                           value="<%= (adminVO==null)? "adcde123" : adminVO.getAdm_acct()%>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">���u�K�X:</label>
                                <div class="col-sm-10">
                                    <input class="form-control" id="disabledInput"
                                           type="text" value="<%= sng.generator(6)%>"
                                           placeholder="Disabled input here..." disabled>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">���u�H�c</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control round-form"
                                           name="adm_acct" placeholder="email@example.com"
                                           value="<%= (adminVO==null)? "aaa@xxx.com" : adminVO.getAdm_mail()%>">
                                </div>
                            </div>
                        </form>
                    </div>
                </div><!-- col-lg-12-->
            </div><!-- /row -->

            <!-- INPUT MESSAGES -->
            <div class="row mt">
                <!-- CUSTOM TOGGLES -->
                <div class="col-lg-12">
                    <div class="form-panel">
                        <h4 class="mb"><i class="fa fa-angle-right"></i> Custom Toggles</h4>
                        <div class="row mt">
                            <div class="col-sm-6 text-center">
                                <input type="checkbox" checked="" data-toggle="switch"/>
                            </div>
                            <div class="col-sm-6 text-center">
                                <input type="checkbox" data-toggle="switch"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- /row -->


        </section>
        <! --/wrapper -->
    </section><!-- /MAIN CONTENT -->
    <!--main content end-->
    <!--footer start-->
    <footer class="site-footer">
        <div class="text-center">
            2017 - BaBeQ
            <a href="#main-content" class="go-top">
                <i class="fa fa-angle-up"></i>
            </a>
        </div>
    </footer>
    <!--footer end-->
</section>
<!-- js placed at the end of the document so the pages load faster -->
<script src="<%=request.getContextPath()%>/admin/backend/assets/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/admin/backend/assets/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="<%=request.getContextPath()%>/admin/backend/assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="<%=request.getContextPath()%>/admin/backend/assets/js/jquery.scrollTo.min.js"></script>
<script src="<%=request.getContextPath()%>/admin/backend/assets/js/jquery.nicescroll.js" type="text/javascript"></script>
<!--common script for all pages �@��JS-->
<script src="<%=request.getContextPath()%>/admin/backend/assets/js/common-scripts.js"></script>
<!--script for this page-->
<script>
    //�R�� custom select box
</script>
</body>
</html>
