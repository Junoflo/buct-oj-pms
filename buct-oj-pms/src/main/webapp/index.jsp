<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>首页－OJ出题管理系统</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css">
    <link rel="stylesheet" type="text/css" href="css/theme.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.css">

    <script src="js/jquery-1.8.1.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.js"></script>
    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;S
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

  </head>
  <body>
    <div class="navbar">
        <div class="navbar-inner">
            <div class="container-fluid">
                <ul class="nav pull-right">
                    <li id="fat-menu" class="dropdown">
                        <a href="#" id="drop3" role="button" class="dropdown-toggle">
                            <i class="icon-user"></i>
                            <c:set var="str" scope="page" value="${curent_user.name}"/>
                            <c:if test="${empty str}">
  								您未登录!
							</c:if>
							<c:if test="${not empty str}">
								当前用户：${str} &nbsp;&nbsp;&nbsp;
							</c:if>
							<i class="dropdown"></i>
                        </a>
                    </li>
                </ul>
                <span style='margin-left:10px'><a href='index.jsp'><font size='5'>OJ出题管理系统</font></a></span>
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
                  <li ><a href="./pages/sign-in.html">登陆</a></li>
                  <li ><a href="./pages/sign-up.html">注册</a></li>
                  <li ><a href="./pages/reset-password.html">忘记密码</a></li>
                </ul>
                <div class="nav-header" data-toggle="collapse" data-target="#settings-menu"><i class="icon-exclamation-sign"></i>注意事项</div>
                <ul id="settings-menu" class="nav nav-list collapse in">
                  
                  <li ><a href="./pages/standard-program-format.jsp">标程格式</a></li>
                  <li ><a href="./pages/random-program-format.jsp">随机程序格式</a></li>
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
			<script type="text/javascript" src="js/graphDemo.js"></script>
	<h2 class="page-title">如何使用</h2>
	<div class="row-fluid">
	    <div class="block">
	        <ol>
					<li>
					<div style = "margin-top:20px;">
						<span class="content-text">输入题目基本信息(标题,题目描述,
						输入描述,输出描述,输入样例,输出样例,提示,来源)参见<a href="http://coder.buct.edu.cn" target="_blank">coder.buct.edu.cn</a></span>
					</div>
					</li>
					<li>
						<div style = "margin-top:20px;">
							<span class="content-text"><span class="content-text">提交标程文件;&nbsp;&nbsp;
							标程:即标准程序;&nbsp;&nbsp;示例:&nbsp;&nbsp;<a href = 'standard-program-format.jsp'>标程示例</a></span></span>
						</div>
					</li>
					<li>
						<div style = "margin-top:20px">
						<span class="content-text">提交随机程序文件;&nbsp;&nbsp;
						随机程序:即能够生成原始测试用例集的程序.&nbsp;&nbsp;示例:&nbsp;&nbsp;<a href = 'random-program-format.jsp'>随机程序示例</a></span>
						</div>
					</li>
					<li>
						<div style = "margin-top:20px">
						<span class="content-text">
						输入原始测试用例分隔符(一般为一个字符串,与随机程序里的分隔符一致.用户需要注意不要与测试数据冲突)
						</span>
						</div>
					</li>
					<li>
						<div style = "margin-top:20px">
						<span class="content-text">
						提交后台处理
						</span>
						</div>
					</li>
					<li>
						<div style = "margin-top:20px">
						<span class="content-text">有关输入描述,输出描述(参考<a href = 'http://coder.buct.edu.cn' target="_blank">coder.buct.edu.cn</a>)
						</span>
						</div>
					</li>
					<li>
						<div style = "margin-top:20px">
						<span class="content-text">有关输入样例,输出样例(参考<a href = 'http://coder.buct.edu.cn' target="_blank">coder.buct.edu.cn</a>)
						</span>
						</div>
					</li>
				</ol>
	    </div>
	</div>
	<h2 class="page-title">能做什么</h2>
		<div class="row-fluid">
    		<div class="block">
	    		<ol>
	    			<li>
	    				<div style = "margin-top:20px">
						<span class="content-text">针对用户提交的题目生成对应的测试数据</span>
						</div>
					</li>
	    			<li><div style = "margin-top:20px">
						<span class="content-text">减轻出题人工作量(只需要少量的编码工作)</span>
						</div>
					</li>
	    			<li><div style = "margin-top:20px">
						<span class="content-text">数据的可靠性(保证所有结果测试用例达到全语句覆盖标程)</span>
						</div>
					</li>
	    		</ol>    
    		</div>
   		</div>
	</div>
  </div>
  <div style="height:150px">
</div>
</div>
  </body>
</html>