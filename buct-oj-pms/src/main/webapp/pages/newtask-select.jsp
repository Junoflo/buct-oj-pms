<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>新建任务-OJ出题管理系统</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap-responsive.css">
    <link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">

    <script src="lib/jquery-1.8.1.min.js" type="text/javascript"></script>

    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
        .content-text{
        	font-size:15px;
        }
    </style>

    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
  </head>
  <body>
    <div class="navbar">
        <div class="navbar-inner">
            <div class="container-fluid">
                <ul class="nav pull-right">
                    <li id="fat-menu" class="dropdown">
                         <a href="#" id="drop3" role="button" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-user"></i>
                            <c:set var="str" scope="page" value="${curent_user.name}"/>
                            <c:if test="${empty str}">
  								您未登录!
							</c:if>
							<c:if test="${not empty str}">
								当前用户：${str} &nbsp;&nbsp;&nbsp;
							</c:if>
                        </a>
                    </li>
                </ul>
                <a class="brand" href="index.jsp"><span class="first"></span> <span class="second">OJ出题管理系统</span></a>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span3">
                <div class="sidebar-nav">
                  <div class="nav-header" data-toggle="collapse" data-target="#dashboard-menu"><i class="icon-dashboard"></i>功能列表</div>
                    <ul id="dashboard-menu" class="nav nav-list collapse in">
                        <li><a href="index.jsp">首页</a></li>
                        <li ><a href="record.jsp">提交记录</a></li>
                        <li ><a href="newtask-select.jsp">新建任务</a></li>
                        <li ><a href="export.jsp">导出任务</a></li>
                        <li ><a href="spider.jsp">爬虫抓题</a></li>
                    </ul>
                <div class="nav-header" data-toggle="collapse" data-target="#accounts-menu"><i class="icon-briefcase"></i>账户</div>
                <ul id="accounts-menu" class="nav nav-list collapse in">
                  <li ><a href="sign-in.html">登陆</a></li>
                  <li ><a href="sign-up.html">注册</a></li>
                  <li ><a href="reset-password.html">忘记密码</a></li>
                </ul>
                <div class="nav-header" data-toggle="collapse" data-target="#settings-menu"><i class="icon-exclamation-sign"></i>注意事项</div>
                <ul id="settings-menu" class="nav nav-list collapse in">
                  
                  <li ><a href="standard-program-format.jsp">标程格式</a></li>
                  <li ><a href="random-program-format.jsp">随机程序格式</a></li>
                  
                </ul>
                <div class="nav-header" data-toggle="collapse" data-target="#legal-menu"><i class="icon-legal"></i>F&Q</div>
                <ul id="legal-menu" class="nav nav-list collapse in">
                  <li ><a href="404.html">如何导入OJ系统?</a></li>
                  <li ><a href="404.html">测试数据范围?</a></li>
                </ul>
            </div>
        </div>
        <div class="span9">
            <script type="text/javascript" src="js/jquery.jqplot.min.js"></script>
			<script type="text/javascript" charset="utf-8" src="js/graphDemo.js"></script>
	<h2 class="page-title">新建任务</h2>
	<hr>
	<p><a href="new-task.jsp">单任务提交入口</a></p>
	<p><a href="multi-task.jsp">多任务提交入口</a></p>
	</div>
  </div>
  <div style="height:150px">
</div>
</div>
    <script src="lib/bootstrap/js/bootstrap.js"></script>
  </body>
</html>