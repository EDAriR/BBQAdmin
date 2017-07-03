<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login BBQ</title>
    <!-- Bootstrap core CSS -->
    <link href="backend/assets/css/bootstrap.css" rel="stylesheet">
    <!--external css  ICON-->
    <link href="backend/assets/font-awesome/css/font-awesome.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="backend/assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="backend/assets/js/gritter/css/jquery.gritter.css"/>
    <link rel="stylesheet" type="text/css" href="backend/assets/lineicons/style.css">
    <link href="backend/assets/css/style-responsive.css" rel="stylesheet">
    <link href="backend/assets/css/table-responsive.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="backend/assets/css/style.css" rel="stylesheet">
    <link href="backend/assets/css/style-responsive.css" rel="stylesheet">
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
            <h3><i class="fa fa-angle-right"></i>�٦� 9487 �� �ݼf�� </h3>
            <div class="row">
                <div class="col-md-12">
                    <div class="content-panel">
                        <table class="table table-striped table-advance table-hover">
                            <h4><i class="fa fa-angle-right"></i> ���f��</h4>
                            <hr>
                            <thead>
                            <tr>
                                <th><i class="fa fa-bullhorn"></i> �ӽз|��</th>
                                <th class="hidden-phone"><i class="fa fa-question-circle"></i> �ӽвz��</th>
                                <th><i class="fa fa-bookmark"></i> �ӽФ��</th>
                                <th><i class=" fa fa-edit"></i> Status</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><a href="basic_table.html#">Company Ltd</a></td>
                                <td class="hidden-phone">Lorem Ipsum dolor</td>
                                <td>2017/07/28</td>
                                <td><a href="#" class="btn btn-default"><span
                                        class="glyphicon glyphicon-share-alt"></span> �i�}</a></td>

                            </tr>
                            <tr>
                                <td>
                                    <a href="basic_table.html#">
                                        Dashgum co
                                    </a>
                                </td>
                                <td class="hidden-phone">Lorem Ipsum dolor</td>
                                <td>2017/06/14</td>
                                <td><a href="#" class="btn btn-default"><span
                                        class="glyphicon glyphicon-share-alt"></span> �i�}</a></td>

                            </tr>
                            <tr>
                                <td>
                                    <a href="basic_table.html#">
                                        Another Co
                                    </a>
                                </td>
                                <td class="hidden-phone">Lorem Ipsum dolor</td>
                                <td>2017/06/14</td>
                                <td><a href="#" class="btn btn-default"><span
                                        class="glyphicon glyphicon-share-alt"></span> �i�}</a></td>

                            </tr>
                            <tr>
                                <td>
                                    <a href="basic_table.html#">
                                        Dashgum ext
                                    </a>
                                </td>
                                <td class="hidden-phone">Lorem Ipsum dolor</td>
                                <td>217/06/14</td>
                                <td><a href="#" class="btn btn-default"><span
                                        class="glyphicon glyphicon-share-alt"></span> �i�}</a></td>

                            </tr>
                            <tr>
                                <td><a href="basic_table.html#">Total Ltd</a></td>
                                <td class="hidden-phone">Lorem Ipsum dolor</td>
                                <td>170/06/14</td>
                                <td><a href="#" class="btn btn-default"><span
                                        class="glyphicon glyphicon-share-alt"></span> �i�}</a></td>

                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- /content-panel -->
                </div>
                <!-- /col-md-12 -->
            </div>
            <!-- /row -->
            <!-- /row -->
            <div class="row mt">
                <div class="col-md-12">
                    <div class="content-panel">
                        <table class="table table-striped table-advance table-hover">
                            <h4><i class="fa fa-angle-right"></i> �ݼf�����|</h4>
                            <hr>
                            <thead>
                            <tr>
                                <th><i class="fa fa-bullhorn"></i> �Q���|���O</th>
                                <th class="hidden-phone"><i class="fa fa-question-circle"></i> �Q���|�H</th>
                                <th><i class="fa fa-bookmark"></i>���|���e</th>
                                <th><i class=" fa fa-edit"></i> Status</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><a href="basic_table.html#">Company Ltd</a></td>
                                <td class="hidden-phone">Lorem Ipsum dolor</td>
                                <td>12000.00$</td>
                                <td><a href="#" class="btn btn-default"><span
                                        class="glyphicon glyphicon-share-alt"></span> �i�}</a></td>

                            </tr>
                            <tr>
                                <td>
                                    <a href="basic_table.html#">
                                        Dashgum co
                                    </a>
                                </td>
                                <td class="hidden-phone">Lorem Ipsum dolor</td>
                                <td>17900.00$</td>
                                <td><a href="#" class="btn btn-default"><span
                                        class="glyphicon glyphicon-share-alt"></span> �i�}</a></td>

                            </tr>
                            <tr>
                                <td>
                                    <a href="basic_table.html#">
                                        Another Co
                                    </a>
                                </td>
                                <td class="hidden-phone">Lorem Ipsum dolor</td>
                                <td>14400.00$</td>
                                <td><a href="#" class="btn btn-default"><span
                                        class="glyphicon glyphicon-share-alt"></span> �i�}</a></td>

                            </tr>
                            <tr>
                                <td>
                                    <a href="basic_table.html#">
                                        Dashgum ext
                                    </a>
                                </td>
                                <td class="hidden-phone">Lorem Ipsum dolor</td>
                                <td>22000.50$</td>
                                <td><a href="#" class="btn btn-default"><span
                                        class="glyphicon glyphicon-share-alt"></span> �i�}</a></td>

                            </tr>
                            <tr>
                                <td><a href="basic_table.html#">Total Ltd</a></td>
                                <td class="hidden-phone">Lorem Ipsum dolor</td>
                                <td>12120.00$</td>
                                <td><a href="#" class="btn btn-default"><span
                                        class="glyphicon glyphicon-share-alt"></span> �i�}</a></td>

                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- /content-panel -->
                </div>
                <!-- /col-md-12 -->
            </div>
            <!-- /row -->
        </section>
        <! --/responsive wrapper -->
    </section>
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
<script src="backend/assets/js/jquery.js"></script>
<script src="backend/assets/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="backend/assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="backend/assets/js/jquery.scrollTo.min.js"></script>
<script src="backend/assets/js/jquery.nicescroll.js" type="text/javascript"></script>
<!--common script for all pages �@��JS-->
<script src="backend/assets/js/common-scripts.js"></script>
<!--script for this page-->
<script>
    //�R�� custom select box
</script>
</body>
</html>
