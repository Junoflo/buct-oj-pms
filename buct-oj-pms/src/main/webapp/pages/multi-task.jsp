<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>新建任务－OJ出题管理系统</title>  
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-responsive.css">
    <link rel="stylesheet" type="text/css" href="../css/theme.css">
    <link rel="stylesheet" type="text/css" href="../css/font-awesome.css">
    
	<script type = "text/javascript" src = "../js/jquery-3.1.1.min.js"></script>
    <script type = "text/javascript" src = "../js/ajaxfileupload.js"></script>
	<script type = "text/javascript" src = "../js/bootstrap.js"></script>
    
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
    </style>
	<script>
		function startNewTask(){
			if($("#uploadFile").val() == ""){
				alert("请选择文件!");
				return ;
			}
			var myJSONObject = {
	    			"uid" : "${curent_user.id}",
	    			"username" : "${curent_user.name}",
	    			"separator" : $("#separator").val()
	    	};
	    	var str = JSON.stringify(myJSONObject) 
			$.ajaxFileUpload({
                url: 'common/multiTask', //用于文件上传的服务器端请求地址
                type: 'post',
                secureuri: false, //是否需要安全协议，一般设置为false
                fileElementId: ['upload'], //文件上传域的ID
                dataType: 'json', //返回值类型 一般设置为json
                data:{jsonString:encodeURI(str)},
                success: function (data){  //服务器成功响应处理函数
                	alert(data.result);
                }
			})
		}
		$(function(){
			$("#btnSubmit").click(function(){
				startNewTask();
			})
		})
	</script>
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
                <span style='margin-left:10px'><a href='../index.jsp'><font size='5'>OJ出题管理系统</font></a></span>
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
            <script type="text/javascript" src	="../js/jquery.jqplot.min.js"></script>
			<script type="text/javascript" src = "../js/graphDemo.js"></script>
	<h1 class="page-title">新建任务</h1>
	<h3>请按照<a href="#sampleXML">示例格式</a>提交一份xml文件,其中包含你所需要处理的所有题目</h3>
	<font color='red'>说明:</font>遇到冲突字符不必转义,提交的文件后缀可以为txt
	<div style="height:30px"></div>
	<div class="row-fluid">
	    <div class="block span6">
	    	<hr>
	         &nbsp;&nbsp;&nbsp;&nbsp;上传文件&nbsp;&nbsp;&nbsp;&nbsp;
	         &nbsp;&nbsp;&nbsp; 
	        <input type="file" id="upload" name="upload" />
			<hr>			
	    </div>
	</div>
	<div class="row-fluid">
		
	</div>
	<div style="height:100px;">
    		<button id="btnSubmit" class="btn btn-primary btn-lg">提交后台</button>
    </div>
    <div id="sampleXML" >
    	<h3 id="sample" class="page-title">示例格式</h3>
		<div class="row-fluid">
		    <div class="block">
  	<pre>
&#60;problems>
	&#60;problem>
		&#60;title>(标题)
		&#60;/title>
		&#60;desc>(题目描述)
		&#60;/desc>
		&#60;input_desc>(输入描述)
		&#60;/input_desc>
		&#60;output_desc>(输出描述)
		&#60;/output_desc>
		&#60;input_sample>(输入样例)
		&#60;/input_sample>
		&#60;output_sample>(输出样例)
		&#60;/output_sample>
		&#60;hint>(提示)
		&#60;/hint>
		&#60;source>(来源)
		&#60;/source>
		&#60;standard_program>(标准程序)
		&#60;/standard_program>
		&#60;random_program>(随机程序)
		&#60;/random_program>
		&#60;separator>(测试用例分隔符,与随机程序里的分隔符一致)
		&#60;/separator>
	&#60;/problem>
	&#60;problem>
	...
	&#60;/problem>
&#60;/problems>
  	</pre>
		    </div>
		</div>
		<div style="height:300px">
    		</div>
    </div>
    </div>
    </div>
    </div>
  </body>
</html>
