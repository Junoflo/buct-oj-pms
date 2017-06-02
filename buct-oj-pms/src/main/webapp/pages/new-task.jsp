<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>新建任务-OJ出题管理系统</title>
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
	<script type = "text/javascript">
		function autoLoad(){
			//alert("当前用户id: " + "${curent_user.id}");
			$("#uid").val("${curent_user.id}");
			$("#username").val("${curent_user.name}");
			//alert($("#username").val());
			$("#title").val("Find Number");
			$("#pro_desc").val("找出数组中是否存在指定的数");
			$("#input_desc").val("输入包括2行数据，第一行有两个数，第一个是数组长度，第二个是target 第二行是数组内容");
			$("#output_desc").val("如果找到target 输出第一次找到的下标 如果没找到 输出-1");
			$("#input_sample").val("5 47\n94 39 40 46 74\n3 1\n1 2 3");
			$("#output_sample").val("-1\n0");
			$("#hint").val("无");
			$("#source").val("无");
			$("#separator").val("###");
		}
		function checkAll(){
			if($("#uid").val() == ""){
				alert("用户ID为空!");
				return false;
			}
			if($("#title").val() == ""){
				$("#title").focus();
				return false;
			}
			if($("#pro_desc").val() == ""){
				$("#pro_desc").focus();
				return false;
			}
			if($("#input_desc").val() == ""){
				$("#input_desc").focus();
				return false;
			}
			if($("#output_desc").val() == ""){
				$("#output_desc").focus();
				return false;
			}
			if($("#input_sample").val() == ""){
				$("#input_sample").focus();
				return false;
			}
			if($("#output_sample").val() == ""){
				$("#output_sample").focus();
				return false;
			}
			if($("#hint").val() == ""){
				$("#hint").focus();
				return false;
			}
			if($("#source").val() == ""){
				$("#source").focus();
				return false;
			}
			if($("#separator").val() == ""){
				$("#separator").focus();
				return false;
			}
			return true;
		}
		function entity(uid,username,title,desc,input_desc,output_desc,input_sample,output_sample,hint,source,separator){
			this.uid = uid;
			this.username = username;
			this.title = title;
			this.desc = desc;
			this.input_desc = input_desc;
			this.output_desc = output_desc;
			this.input_sample = input_sample;
			this.output_sample = output_sample;
			this.hint = hint;
			this.source = source;
			this.separator = separator;
		}
		function startNewTask(){
			if(checkAll() == false){
				return ;
			}
			if($("#standard_program").val() == ""){
				alert("请选择标程文件!");
				return ;
			}
			if($("#random_program").val() == ""){
				alert("请选择随机程序文件!");
				return ;
			}
			var str = JSON.stringify(new entity($("#uid").val(),$("#username").val(),
					$("#title").val(),$("#pro_desc").val(),$("#input_desc").val(),
					$("#output_desc").val(),$("#input_sample").val(),
					$("#output_sample").val(),$("#hint").val(),$("#source").val(),
					$("#separator").val()
					));
			$.ajaxFileUpload({
                url: 'common/newTask', //用于文件上传的服务器端请求地址
                type: 'post',
                secureuri: false, //是否需要安全协议，一般设置为false
                fileElementId: ['standard_program','random_program'], //文件上传域的ID
                dataType: 'json', //返回值类型 一般设置为json
                data:{jsonString:encodeURI(str)},
                success: function (data){  //服务器成功响应处理函数
        			/* var str = data.substring(data.indexOf("{"),data.indexOf("}")+1);
                	var jsonObject = JSON.parse(str);
                	$("#file1Name").val(jsonObject.file_name);
                	alert($("#file1Name").val());
                	fileStandardProName = jsonObject.file_name;
                	fileStandardProPath = jsonObject.save_path; */
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
            <script type="text/javascript" src	="../js/jquery.jqplot.min.js"></script>
			<script type="text/javascript" src = "../js/graphDemo.js"></script>
	<h1 class="page-title">新建任务</h1>
	<button class = "btn btn-primary" onclick = "autoLoad()">自动导入(测试用)</button>
	<div class="row-fluid">
	<div class="block-heading" data-toggle="collapse" data-target="#base_info">题目基本信息</div>
	<div class ="block">
	<div id="base_info" class="block-body collapse in">
	<div class="row-fluid">
	    <div class="block span6">
	    	<input type="hidden" value="${curent_user.id} " id="uid" name="uid"/>
	    	<input type="hidden" value="${curent_user.name} " id="username" name="username"/>	    	
	    	<hr>
	        &nbsp;&nbsp;&nbsp;&nbsp;标&nbsp;&nbsp;&nbsp;&nbsp;
	        &nbsp;&nbsp;&nbsp;题&nbsp;&nbsp;&nbsp;
	        <input type="text" class="form-control" value="" id="title" name="title"/>
			<hr>			
	    </div>
	    <div class="block span6">
	    	<hr>
	        &nbsp;&nbsp;&nbsp;&nbsp;题目描述&nbsp;&nbsp;&nbsp;
	        <input type="text" class="form-control" value="" id="pro_desc" name="proDesc"/>
			<hr>			
	    </div>
	</div>
	<div class="row-fluid">
		<div class="block span6">
	    	<hr>
	        &nbsp;&nbsp;&nbsp;&nbsp;输入描述&nbsp;&nbsp;&nbsp;
	        <textarea class="textarea" id="input_desc" name="inputDesc"></textarea>
			<hr>
	    </div>
	    <div class = "block span6">
	    	<hr>
	    	&nbsp;&nbsp;&nbsp;&nbsp;输出描述&nbsp;&nbsp;&nbsp;
	    	<textarea class="textarea" id="output_desc" name="outputDesc"></textarea>
	    	<hr>
	    </div>
	</div>
	<div class="row-fluid">
		<div class="block span6">
	    	<hr>
	        &nbsp;&nbsp;&nbsp;&nbsp;输入样例&nbsp;&nbsp;&nbsp;
	        <textarea class="textarea" id="input_sample" name="inputSample"></textarea>
			<hr>
	    </div>
	    <div class = "block span6">
	    	<hr>
	    	&nbsp;&nbsp;&nbsp;&nbsp;输出样例&nbsp;&nbsp;&nbsp;
	    	<textarea class="textarea" id="output_sample" name="outputSample"></textarea>
	    	<hr>
	    </div>
	</div>
	<div class="row-fluid">
	    <div class="block span6">
	    	<hr>
	        &nbsp;&nbsp;&nbsp;&nbsp;提&nbsp;&nbsp;&nbsp;&nbsp;
	        &nbsp;&nbsp;&nbsp;示&nbsp;&nbsp;&nbsp;
	        <input type="text" class="form-control" id="hint" name="hint"/>
			<hr>			
	    </div>
	    <div class="block span6">
	    	<hr>
	        &nbsp;&nbsp;&nbsp;&nbsp;题目来源&nbsp;&nbsp;&nbsp;
	        <input type="text" class="form-control" id="source" name="source"/>
			<hr>			
	    </div>
	</div>
	</div>
	</div>
	</div>
	<div class="row-fluid">
	    <div class="block span6">
	    	<hr>
	         &nbsp;&nbsp;&nbsp;&nbsp;标&nbsp;&nbsp;&nbsp;&nbsp;
	         &nbsp;&nbsp;&nbsp;程&nbsp;&nbsp;&nbsp; 
	        <input type="file" id="standard_program" name="standardProgram" />
			<hr>			
	    </div>
	    <div class="block span6">
	    	<hr>
	         &nbsp;&nbsp;&nbsp;&nbsp;随机程序&nbsp;&nbsp;&nbsp; 
	        <input type="file" id="random_program" name="randomProgram" />
			<hr>			
	    </div>
	</div>
	<div class="row-fluid">
	    <div class="block span6">
	    	<hr>
	         &nbsp;&nbsp;&nbsp;&nbsp;测试用例分隔符&nbsp;&nbsp;&nbsp; 
	        <input type="text" class="form-control" id="separator" name="separator"/>
			<hr>			
	    </div>
	</div>
	<div style="height:200px;margin-left:230px;margin-top:30px;">
    		<button id="btnSubmit" class="btn btn-primary btn-lg">提交后台</button>
    		<button class="btn btn-primary btn-lg" style="margin-left:300px">重置内容</button>
    </div>
	
    </div>
    </div>
    </div>
  </body>
</html>
