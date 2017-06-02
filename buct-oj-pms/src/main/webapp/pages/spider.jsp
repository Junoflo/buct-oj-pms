<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>爬虫抓题-OJ出题管理系统</title>

    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-responsive.css">
    <link rel="stylesheet" type="text/css" href="../css/theme.css">
    <link rel="stylesheet" href="../css/font-awesome.css">

    <script src="../js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js"></script>
	<script src="../js/json2.js" type="text/javascript"></script>
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
	
    <script>
    	$(function(){
    		$("#username").val("buct_chen");
			$("#userpass").val("6481czx123");
    		$("#btnFind").click(function(){
    			
    			fetchProblems();
    		})
    	})
	    function fetchProblems(){
    		var username = $("#username").val();
    		var userpass = $("#userpass").val();
    		var problemId = $("#problem_id").val();
    		if(username == ""){
    			$("#username").focus();
    			return ;
    		}
    		if(userpass == ""){
    			$("#userpass").focus();
    			return ;
    		}
    		if(problemId == ""){
    			$("#problem_id").focus();
    			return ;
    		}
	    	if(isNaN(problemId)){
	    		$("#problem_id").focus();
	    		return ;
	    	}
	    	var myJSONObject = {
	    			"username" : username,
	    			"userpass" : userpass,
	    			"problem_id" : problemId,
	    			"platform" : $("#ojselected").val()
	    	};
	    	var str = JSON.stringify(myJSONObject) ;
	    	//alert(str);
	    	 $.ajax({
		        cache : false,
		        type:'post',
		        dataType:'json',
		            url:'common/fetchProblem',
		            data:{jsonString:encodeURI(str)},
		        success:function(data){
		        	showProblemDetail(data);
		        }
		    }); 
	    }
	    function showProblemDetail(data){
	    	var str = "";
	    	if(data.result == "error"){
	    		str += "<font color='red' size='3'>";
	    		str += "没有抓取到相关数据!\n";
	    		str += "</font>";
	    		$("#content").html(str);
	    		return ;
	    	}
	    	str = "<div style='height:10px'></div>"+
	    	"<h2 class='page-title'>"+
	    	"<p align='center'>No."+data.acmProblem.id+"&nbsp;&nbsp;"+data.acmProblem.title+"</p>"+
	    	"</h2>"+
	    	"<h4 class='page-title'>&nbsp;题目描述</h4>"+
	    	"<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data.acmProblem.problemDescription+"</span>"+
	    	"<h4 class='page-title'>&nbsp;输入描述</h4>"+
	    	"<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data.acmProblem.input+"</span>"+
	    	"<h4 class='page-title'>&nbsp;输出描述</h4>"+
	    	"<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data.acmProblem.output+"</span>"+
	    	"<h4 class='page-title'>&nbsp;输入样例</h4>"+
	    	"<pre>"+data.acmProblem.sampleInput+"</pre>"+
	    	"<h4 class='page-title'>&nbsp;输出样例</h4>"+
	    	"<pre>"+data.acmProblem.sampleOutput+"</pre>"+
	    	"<h4 class='page-title'>&nbsp;提示</h4>"+
	    	"<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data.acmProblem.recommend+"</span>"+
	    	"<h4 class='page-title'>&nbsp;来源</h4>"+
	    	"<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data.acmProblem.source+"</span>";
	    	$("#content").html(str);
	    	
    		var codeContent = "<div class='block'>" +
        	"<div id='haha' class='block-heading' data-toggle='collapse'" + 
        	"data-target='#resultSet'>" + "标程</div>" +
        	"<div id='resultSet' class='block-body collapse in'>";
        	codeContent += "<div style='height:10px'> </div>";
        	codeContent += "<pre>" +
	    		data.acmProblem.stdCode + 
	    		"</pre>";
	    	codeContent += "</div></div></div>";
	    	
	    	codeContent += "<div class='row-fluid'>"
	    	codeContent += "<div class='block span6'>" + "<hr>" + 
	    		"&nbsp;&nbsp;&nbsp;随机程序&nbsp;&nbsp;&nbsp;" + 
	    		"<input type='file' id='random_program' name='randomProgram' />" + "<hr></div></div>";
	    	codeContent += "<div><button id='btnSubmit' class='btn btn-primary btn-lg'" + 
	    		"style='width:110px;margin-left:0px'>提交任务</button></div>";
	    	$("#codeContent").html(codeContent);
	    }
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
	<h2 class="page-title">爬虫抓题</h2>
		<hr>
		<div style="height:200px;width:100%;margin-left:200px">
		<div>
			<div style="height:30px;width:70px;float:left">
				<p style="margin-top:7px">选择平台</p>
			</div>
			<div>
				<select id="ojselected">
			      <option>HDU Online Judge System</option>
			      <option>PKU JudgeOnline</option>
			      <option>ZCMU OnlineJudge</option>
	  			</select>
			</div>
		</div>
			
		<div>
			<p>
				用&nbsp;&nbsp;户&nbsp;名&nbsp;&nbsp;&nbsp;
				<input type="text" class="form-control" id="username"/>
			</p>
			<p>
				密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码&nbsp;&nbsp;&nbsp;
				<input type="text" class="form-control" id="userpass"/>
			</p>
			<p>
				题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号&nbsp;&nbsp;&nbsp;
				<input type="text" class="form-control" id="problem_id"/>
			</p>
		</div>
		<div>
    		<button id="btnFind" class="btn btn-primary btn-lg" style='width:110px;margin-left:70px'>提交</button>
    	</div>
    	
		</div>
		<div style="height:30px;width:100%">
		</div>
		<hr>
		
		<div id='content'>
		</div>
		<!-- 
		<div class="block-heading" data-toggle="collapse" data-target="#widget2container">标程代码</div>
        <div id="widget2container" class="block-body collapse in">
        	<div id = "record_table">
        	</div>
        </div>
         -->
         <div id='codeContent'>
         </div>
         <div style="height:300px">
    		</div>
		<div style="height:130px">
		</div>
	</div>
	
	
	</div>
	</div>
	
</body>
</html>