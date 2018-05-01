<%--
  Created by IntelliJ IDEA.
  User: NoControl
  Date: 2018/4/26
  Time: 10:20
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
    <link type="text/css" href="<%=request.getContextPath()%>/js/skin/layer.css" rel="stylesheet"/>
    <!--[if lt IE 9]-->
    <%--<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>--%>
    <!--[endif]-->
    <script src="<%=request.getContextPath()%>/js/jquery-1.11.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/layer.js"></script>
    <title>caseInfo</title>
    <script charset="utf-8" type="text/javascript" language="javascript" src="caseInfo.js"></script>
    <style type="text/css">
        table{
            border: 1px solid #ccc;
            margin-bottom: 10px;
        }
        tr{
            height: 50px;
        }
        td {
            padding: .5em .5em;
            border-bottom: solid 1px #ccc;
        }
        .foldtl { position: relative; -webkit-box-shadow: 5px 5px 5px rgba(0,0,0,0.8); -moz-box-shadow: 5px 5px 5px rgba(0,0,0,0.8); box-shadow: 5px 5px 5px rgba(0,0,0,0.8); }
        .foldtl:before { content: ""; position: absolute; top: 0%; left: 0%; width: 0px; height: 0px; border-bottom: 70px solid #eee; border-left: 70px solid transparent; -webkit-box-shadow: 7px 7px 7px rgba(0,0,0,0.3); -moz-box-shadow: 7px 7px 7px rgba(0,0,0,0.3); box-shadow: 7px 7px 7px rgba(0,0,0,0.3); }
        .foldtl:after { content: ""; position: absolute; top: 0%; left: 0%; width: 0px; height: 0px; border-top: 69px solid #272822; border-right: 69px solid transparent; }
    </style>
</head>
<body style="background-color: #272822">
<%--系统根目录--%>
<input id="txtRootPath" type="hidden" value="<%=request.getContextPath()%>"/>
<input id="start_fid" type="hidden" value="<%=request.getParameter("FID")%>">
<div class="container col-xs-offset-2 col-xs-8 foldtl" style="background-color: white; margin-top: 100px;margin-bottom: 100px">
    <div class="row">
        <h2 class="col-xs-offset-4">重大税收违法案件信息</h2>
    </div>
    <div style="padding-top: 30px">
        <table id="case_info" class="col-xs-12">
            <tr>
                <td class="col-xs-4" align="center" bgcolor="#e6f4fc">纳税人名称</td>
                <td class="col-xs-8" align="center" bgcolor="#FFFFFF" id="taxpayer_name"></td>
            </tr>
            <tr>
                <td class="col-xs-4" align="center" bgcolor="#e6f4fc">纳税人识别号</td>
                <td class="col-xs-8" align="center" bgcolor="#FFFFFF" id="id"></td>
            </tr>
            <tr>
                <td class="col-xs-4" align="center" bgcolor="#e6f4fc">组织机构代码</td>
                <td class="col-xs-8" align="center" bgcolor="#FFFFFF" id="organization_code"></td>
            </tr>
            <tr>
                <td class="col-xs-4" align="center" bgcolor="#e6f4fc">注册地址</td>
                <td class="col-xs-8" align="center" bgcolor="#FFFFFF" id="registered_address"></td>
            </tr>
            <tr>
                <td class="col-xs-4" align="center" bgcolor="#e6f4fc">法定代表人或者负责人姓名、性别、证件名称及号码</td>
                <td class="col-xs-8" align="center" bgcolor="#FFFFFF" id="legal_representative"></td>
            </tr>
            <tr>
                <td class="col-xs-4" align="center" bgcolor="#e6f4fc">负有直接责任的财务负责人姓名、性别、证件名称及号码</td>
                <td class="col-xs-8" align="center" bgcolor="#FFFFFF" id="financial_officer"></td>
            </tr>
            <tr>
                <td class="col-xs-4" align="center" bgcolor="#e6f4fc">负有直接责任的中介机构信息及其从业人员信息</td>
                <td class="col-xs-8"align="center" bgcolor="#FFFFFF" id="agency"></td>
            </tr>
            <tr>
                <td class="col-xs-4" align="center" bgcolor="#e6f4fc">案件性质</td>
                <td class="col-xs-8" align="center" bgcolor="#FFFFFF" id="case_nature"></td>
            </tr>
            <tr>
                <td class="col-xs-4" align="center" bgcolor="#e6f4fc">主要违法事实</td>
                <td class="col-xs-8" align="center" bgcolor="#FFFFFF" id="illegal_facts"></td>
            </tr>
            <tr>
                <td class="col-xs-4" align="center" bgcolor="#e6f4fc">相关法律依据及税务处理处罚情况</td>
                <td class="col-xs-8" align="center" bgcolor="#FFFFFF" id="punishment_situation"></td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
