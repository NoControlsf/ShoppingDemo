<%--
  Created by IntelliJ IDEA.
  User: NoControl
  Date: 2018/4/23
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="x-ua-compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="renderer" content="webkit" >
    <!-- Bootstrap -->
    <link type="text/css" href="<%=request.getContextPath()%>/js/bootstrap.min.css" rel="stylesheet"/>
<%--
    <link type="text/css" href="<%=request.getContextPath()%>/js/skin/layer.css" rel="stylesheet"/>
--%>
    <!--[if lt IE 9]-->
    <%--<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>--%>
    <!--[endif]-->
    <script src="<%=request.getContextPath()%>/js/jquery-1.11.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script charset="utf-8" type="text/javascript" language="javascript" src="homepage.js"></script>
<%--
    <script src="<%=request.getContextPath()%>/js/layer.js"></script>
--%>
    <title>homepage</title>
    <style type="text/css">
        .case_one{
            background-color: gainsboro;
            position:absolute;
            box-shadow:0px 8px 16px 0px;
        }
    </style>
</head>
<body>
<%--系统根目录--%>
<input id="txtRootPath" type="hidden" value="<%=request.getContextPath()%>"/>
<input id="start_solrvalue" type="hidden" value="<%=request.getParameter("solrvalue")%>">
<div style="height: 150px;background-color: #007d73" id="search">
    <div class="container">
        <div class="row">
            <div class="col-xs-7 col-xs-offset-1" style="left:1.5%;top:20px;width: 660px;">
                <ul class="nav nav-tabs">
                    <li role="presentation" class="active"><a href="index.jsp" style="color:#000;">全部</a></li>
                    <li role="presentation"><a href="#" style="color:#000;">企业名</a></li>
                    <li role="presentation"><a href="#" style="color:#000;">法人/股东</a></li>
                    <li role="presentation"><a href="#" style="color:#000;">高管</a></li>
                    <li role="presentation"><a href="#" style="color:#000;">品牌/产品</a></li>
                    <li role="presentation"><a href="#" style="color:#000;">联系方式</a></li>
                    <li role="presentation"><a href="#" style="color:#000;">经营范围</a></li>
                </ul>
            </div>
        </div>
        <div class="row">
            <input class="col-xs-6 col-xs-offset-1" id="Keyword" style="left:2.5%;top: 40px;height: 40px;"  onpaste="return false" AUTOCOMPLETE="off" name="Keyword" >
            <div id='scztDiv' style="position:absolute;left:16.4%;top:122px;display:none;z-index:999999;">
                <select id='scztSelect' size="10" style='margin-top:0px;'>
                </select>
            </div>
            <button class="col-xs-2  btn btn-success" style="top: 40px;height: 40px;width: 60px" id="commitName" name="commitName">
                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
            </button>
        </div>
    </div>
</div>
<div id="search_by_key">
    <div class="container col-xs-8 col-xs-offset-1" style="left:6%;margin-bottom:10px;">
        <div class="row">
            查找范围：<span>&nbsp;&nbsp;<a href="#">企业名</a></span>
            <span>&nbsp;&nbsp;<a href="#">法人/股东</a></span>
            <span>&nbsp;&nbsp;<a href="#">高管</a></span>
            <span>&nbsp;&nbsp;<a href="#">品牌/产品</a></span>
            <span>&nbsp;&nbsp;<a href="#">联系方式</a></span>
            <span>&nbsp;&nbsp;<a href="#">经营范围</a></span>
        </div>
        <div class="row">
            企业状态：
        </div>
        <div class="row">
            注册地址：<span>&nbsp;&nbsp;<a href="#">南京</a></span>
            <span>&nbsp;&nbsp;<a href="#">无锡</a></span>
            <span>&nbsp;&nbsp;<a href="#">徐州</a></span>
            <span>&nbsp;&nbsp;<a href="#">常州</a></span>
            <span>&nbsp;&nbsp;<a href="#">苏州</a></span>
            <span>&nbsp;&nbsp;<a href="#">南通</a></span>
            <span>&nbsp;&nbsp;<a href="#">连云港</a></span>
            <span>&nbsp;&nbsp;<a href="#">淮安</a></span>
            <span>&nbsp;&nbsp;<a href="#">盐城</a></span>
            <span>&nbsp;&nbsp;<a href="#">扬州</a></span>
            <span>&nbsp;&nbsp;<a href="#">镇江</a></span>
            <span>&nbsp;&nbsp;<a href="#">泰州</a></span>
            <span>&nbsp;&nbsp;<a href="#">宿迁</a></span>
            <span>&nbsp;&nbsp;<a href="#">张家港保税区</a></span>
            <span>&nbsp;&nbsp;<a href="#">苏州工业园区</a></span>
        </div>
        <div class="row">
            发布日期：<span>&nbsp;&nbsp;<a href="#">2018</a></span>
            <span>&nbsp;&nbsp;<a href="#">2017</a></span>
            <span>&nbsp;&nbsp;<a href="#">2016</a></span>
        </div>
        <div class="row">
            行业门类：
        </div>
    </div>
</div>

<div id="search_result">
    <div class="container">
        <div class="col-xs-offset-1">
            <div id="searchList">
            </div>
        </div>
    </div>
</div>
</body>
</html>
