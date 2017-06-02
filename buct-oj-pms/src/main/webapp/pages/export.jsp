<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>导出任务-OJ出题管理系统</title>
    
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
    </style>
    <script type = "text/javascript">
	    $(function () {
	    	//alert("${curent_user.id}");
	    	var myJSONObject = {
	    			"uid" : "${curent_user.id}"
	    	};
	    	var str = JSON.stringify(myJSONObject) ;
	    	$.ajax({
		        cache : false,
		        type:'post',
		        dataType:'json',
		            url:'problem/briefQueryByUid',
		            data:{jsonString:encodeURI(str)},
		        success:function(data){
		            process(data);
		        }
		    });
	    })
	    function process(data){
	    	if(data.result == "faild"){
	    	//	alert("呵呵");
	    		var str = "<font color='red'>没有查询到相关记录!</font>";
	    		$("#mainDiv").html(str);
	    	}
	    	var str = '';
	    	str += "<table class = 'table' ";
	    	str += "<thead> <tr> <th>编号</th> <th>题目ID</th> <th>题目名称</th>"+
	    	"<th>提交时间</th> <th>操作</th> </tr> </thead>";
	    	str += "<tbody>"
	    	for(var i = 0; i < data.length; i++) {
	    		str += "<tr>";
	    		str += "<td>" + (i+1) + "</td>";
	    		str += "<td>" +  data[i].id + "</td>";
	    		str += "<td>" +  data[i].problemTitle + "</td>";
	    		str += "<td>" +  data[i].submitTimeStr + "</td>";
	    		str += "<td>" +  "<input name='check' id=" + data[i].id + " type='checkbox'";
	    	    str += '</tr>';
	    	}
	    	str += "</tbody>";
	    	str += '</table>';
	    	//alert(str);
	    	$("#record_table").html(str);
	    }
	    function transferDate(stamp){
	    	var date = new Date(stamp);  
	        var str = date.getFullYear() + "-" + (date.getMonth() + 1) + 
	        	"-"+date.getDate() + " " + date.getHours() + ":" + date.getMinutes();
	       // alert(str);
	        return str;
	    }
	    $(function(){
	    	$("#btnSubmit").click(function(){
	    		var s = $("input[name='check']");
	    		var str = "";
	    	    s.each(function(i) {
	    	    	if(this.checked==true){
	    	    		//alert(this.id);
	    	    		str += this.id + ",";
	    	    	}
	    	    });
	    	    if(str == ""){
	    	    	alert("请至少选择一项!");
	    	    	return ;
	    	    }
	    	    alert(str);
	    	    $("#pids").val(str);
	    	    $("#uid").val("${curent_user.id}");
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
            <script type="text/javascript" src="../js/jquery.jqplot.min.js"></script>
			<script type="text/javascript" charset="utf-8" src="../js/graphDemo.js"></script>
	<h2 class="page-title">已完成任务</h2>
	
	<div id = "mainDiv">
   <div class="row-fluid">
    <div class="block">
        <div class="block-heading" data-toggle="collapse" data-target="#widget2container">History</div>
        <div id="widget2container" class="block-body collapse in">
        	<div id = "record_table">
        	</div>
        </div>
    </div>
	</div>
	
	<div style="height:100px;">
			<form action = "common/exportTask" method = "post">
				<input id="uid" type='hidden' name="uid">
				<input id="pids" type='hidden' name="pids">
				<button id="btnSubmit" type="submit" class="btn btn-primary btn-lg">导出选中题目</button>
			</form>
    </div>
	</div>
	</div>
    </div>
</div>
   
  </body>
</html>