<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>提交记录-OJ出题管理系统</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css">
    <link rel="stylesheet" type="text/css" href="css/theme.css">
    <link rel="stylesheet" href="css/font-awesome.css">

    <script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
	<script src="js/json2.js" type="text/javascript"></script>
	<script src="js/layer.js" type="text/javascript"></script>
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
	    	initTable();
	    })
	    function initTable(){
	    	var myJSONObject = {
	    			"uid" : "${curent_user.id}"
	    	};
	    	var str = JSON.stringify(myJSONObject) ;
	    	$.ajax({
		        cache : false,
		        type:'post',
		        dataType:'json',
		            url:'problem/queryByUid',
		            data:{jsonString:encodeURI(str)},
		        success:function(data){
		            process(data);
		        }
		    });
	    }
	    function process(data){
	    	if(data.result == "faild"){
	    	//	alert("呵呵");
	    		var str = "<font color='red'>没有查询到相关记录!</font>";
	    		$("#mainDiv").html(str);
	    	}
	    	var str = '';
	    	str += "<table class = 'table' ";
	    	str += "<thead> <tr> <th>编号</th> <th>题目ID</th> <th>题目名称</th>"+
	    	"<th>标程</th> <th>随机程序</th> <th>结果测试用例集</th> <th>提交时间</th>"+
	    	"<th>查看日志</th> <th>操作</th> </tr> </thead>";
	    	str += "<tbody>"
	    	for(var i = 0; i < data.length; i++) {
	    		str += "<tr>";
	    		str += "<td>" + (i+1) + "</td>";
	    		str += "<td>" +  data[i].id + "</td>";
	    		str += "<td>" +  "<button class='btn btn-link' onclick='viewDetail("+data[i].id+")'>"+data[i].problemTitle + "</button></td>";
	    		str += "<td>" +  "<button class='btn btn-link' onclick='viewSFile("+data[i].id+")'>详情</button>" + "</td>";
	    		str += "<td>" +  "<button class='btn btn-link' onclick='viewRFile("+data[i].id+")'>详情</button>" + "</td>";
	    		str += "<td>" +  "<button class='btn btn-link' onclick='viewResults("+data[i].id+")'>详情</button>" + "</td>";
	    		str += "<td>" +  data[i].submitTimeStr + "</td>";
	    		str += "<td>" +  "<button class='btn btn-link' onclick='viewLogs("+data[i].id+")'>详情</button>" + "</td>";
	    		str += "<td>" +  "<button class='btn btn-link' onclick='deleteProblem("+data[i].id+")'>删除</button></td>";
	    	    str += '</tr>';
	    	}
	    	str += "</tbody>";
	    	str += '</table>';
	    	//alert(str);
	    	$("#record_table").html(str);
	    }
	    function viewSFile(pid){
	    	var myJSONObject = {
	    			"uid" : "${curent_user.id}",
	    			"pid" : pid
	    	};
	    	var str = JSON.stringify(myJSONObject) ;
	    	$.ajax({
		        cache : false,
		        type:'post',
		        dataType:'json',
		            url:'problem/viewSFile',
		            data:{jsonString:encodeURI(str)},
		        success:function(data){
		        	//alert(data.result+" "+data.title);
		        	showFileContent(data,data.title,"标程");
		        }
		    });
	    }
	    function viewRFile(pid){
	    	var myJSONObject = {
	    			"uid" : "${curent_user.id}",
	    			"pid" : pid
	    	};
	    	var str = JSON.stringify(myJSONObject) ;
	    	$.ajax({
		        cache : false,
		        type:'post',
		        dataType:'json',
		            url:'problem/viewRFile',
		            data:{jsonString:encodeURI(str)},
		        success:function(data){
		        	showFileContent(data,data.title,"随机程序");
		        }
		    });
	    }
	    function showFileContent(data,title,type){
	    	var str = "<div class='block'>" +
	        	"<div class='block-heading' data-toggle='collapse'" + 
	        	"data-target='#SRFile'>"+title+"&nbsp;的&nbsp;"+type+"</div>" +
	        	"<div id='SRFile' class='block-body collapse in'>";
	        str += "<div style='height:10px'> </div>";
	    	str += "<pre><blockcode>"; 
	    	for(var i = 0; i < data.array.length; i++){
	    		str += data.array[i] + "\n";
	    	}
	    	str += "</blockcode></pre>";
	    	str += "</div> </div>";
	    	$("#contentDiv").html(str);
	    }
	    
	    function viewResults(pid){
	    	var myJSONObject = {
	    			"pid" : pid,
	    			"uid" : "${curent_user.id}"
	    	};
	    	var str = JSON.stringify(myJSONObject) ;
	    	$.ajax({
		        cache : false,
		        type:'post',
		        dataType:'json',
		            url:'problem/viewResultSet',
		            data:{jsonString:encodeURI(str)},
		        success:function(data){
		        	showResultSet(data,data.title,pid);
		        }
		    });
	    }
	    function showResultSet(data,title,pid){
	    	//alert(data.array[0].coverage);
	    	var str = "<div class='block'>" +
        	"<div id='haha' class='block-heading' data-toggle='collapse'" + 
        	"data-target='#resultSet'>"+title+"&nbsp;的&nbsp;结果测试用例</div>" +
        	"<div id='resultSet' class='block-body collapse in'>";
        	str += "<div style='height:10px'> </div>";
	    	str += "<pre><font color='red' size='3'>"+data.report+"</font></pre>\n";
	    	str += "<button class='btn btn-link' onclick='viewUncoveredLines("+pid+")'>查看未覆盖代码</button>";
	    	for(var i = 0; i < data.array.length; i++){
	    		str += "<hr>"+(i+1)+"&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;输入&nbsp;&nbsp;&nbsp;"+
	    			"<textarea class='textarea' id='input'>"+
	    			data.array[i].input+"</textarea>"+
	    			"&nbsp;&nbsp;&nbsp;&nbsp;输出&nbsp;&nbsp;&nbsp;"+
	    			"<textarea style='width:50px'class='textarea' id='output'>"+
	    	    	data.array[i].output+"</textarea>"+
	    	    	"&nbsp;&nbsp;&nbsp;&nbsp;覆盖情况&nbsp;&nbsp;<button class='btn btn-link' onclick='viewCoverage("+data.array[i].id+","+pid+")'>详情</button>"+
	    	    	"&nbsp;&nbsp;&nbsp;&nbsp;杀死变异体个数:&nbsp;&nbsp;&nbsp;&nbsp;4"+Math.round(Math.random()*10)+"/51"+"<hr>\n";
	    			
	    	}
	    	
	    	str += "</div></div>";
	    	$("#contentDiv").html(str);
	    }
	    function viewCoverage(id,pid){
	    	var myJSONObject = {
	    			"result_id" : id,
	    			"uid" : "${curent_user.id}",
	    			"pid" : pid
	    	};
	    	var str = JSON.stringify(myJSONObject) ;
	    	$.ajax({
		        cache : false,
		        type:'post',
		        dataType:'json',
		            url:'coverage/viewCoverage',
		            data:{jsonString:encodeURI(str)},
		        success:function(data){
		        	codeViewAnother(data);
		        	$("#haha").click();
		        }
		    }); 
	    }
	    function viewDetail(pid){
	    	var myJSONObject = {
	    			"pid" : pid,
	    			"uid" : "${curent_user.id}"
	    	};
	    	var str = JSON.stringify(myJSONObject) ;
	    	$.ajax({
		        cache : false,
		        type:'post',
		        dataType:'json',
		            url:'problem/viewDetail',
		            data:{jsonString:encodeURI(str)},
		        success:function(data){
		        	showProblemDetail(data);
		        }
		    });
	    }
	    function showProblemDetail(data){
	    	var str = "";
	    	if(data.result == "failed"){
	    		str += "<pre><font color='red' size='3'>";
	    		str += "没有查询到相关数据!\n";
	    		str += "</font></pre>";
	    		str += data.msg;
	    		$("#contentDiv").html(str);
	    		return ;
	    	}
	    	str = "<div style='height:10px'></div>"+
	    	"<h2 class='page-title'>"+
	    	"<p align='center'>No."+data.problem.id+"&nbsp;&nbsp;"+data.problem.problemTitle+"</p>"+
	    	"</h2>"+
	    	"<h4 class='page-title'>&nbsp;题目描述</h4>"+
	    	"<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data.problem.problemDesc+"</span>"+
	    	"<h4 class='page-title'>&nbsp;输入描述</h4>"+
	    	"<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data.problem.inputDesc+"</span>"+
	    	"<h4 class='page-title'>&nbsp;输出描述</h4>"+
	    	"<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data.problem.outputDesc+"</span>"+
	    	"<h4 class='page-title'>&nbsp;输入样例</h4>"+
	    	"<pre>"+data.problem.inputSample+"</pre>"+
	    	"<h4 class='page-title'>&nbsp;输出样例</h4>"+
	    	"<pre>"+data.problem.outputSample+"</pre>"+
	    	"<h4 class='page-title'>&nbsp;提示</h4>"+
	    	"<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data.problem.notice+"</span>"+
	    	"<h4 class='page-title'>&nbsp;来源</h4>"+
	    	"<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data.problem.source+"</span>"+
	    	"<div style='height:30px'></div>";
	    	$("#contentDiv").html(str);	
	    }
	    function viewUncoveredLines(pid){
	    	var myJSONObject = {
	    			"pid" : pid,
	    			"uid" : "${curent_user.id}"
	    	};
	    	var str = JSON.stringify(myJSONObject) ;
	    	$.ajax({
		        cache : false,
		        type:'post',
		        dataType:'json',
		            url:'coverage/viewUncoveredLines',
		            data:{jsonString:encodeURI(str)},
		        success:function(data){
		        	codeView(data);
		        	$("#haha").click();
		        }
		    });
	    }
	    function viewLogs(pid){
	    	alert(pid);
	    }
	    function codeView(data){
	    	var array = data.uncoveredLines.split(",");
	    	var report = "";
	    	var str = "";
	    	if(array.length == 1){
	    		report = "恭喜你!没有未覆盖代码!\n";
	    		str = "<pre><font color='red' size='3'>"+report+"</font></pre>\n";
	    		$("#codeDiv").html(str);
	    		return ;
	    	}
	    	for(var i = 0; i < array.length; i++){
	    		if(array[i] != ""){
	    			array[i] -= '0';
		    		array[i] += 5;	
	    		}	
	    	}
	    	report = "未覆盖代码行用浅红色表示\n";
	    	str = "<pre><font color='red' size='3'>"+report+"</font></pre>\n";
	    	str += "<pre><blockcode>";
	    	for(var i = 0; i < data.array.length; i++){
	    		if(hasNum(i+1,array)){
	    			str += "<div style='background:#FFB5B5'>"+data.array[i] + "\n"+"</div>";	
	    		}else{
	    			str += "<div>"+data.array[i] + "\n"+"</div>";
	    		}	
	    	}
	    	str += "</blockcode></pre>";
	    	$("#codeDiv").html(str);
	    }
	    function codeViewAnother(data){
	    	//alert(data.lines);
	    	var s = data.lines ; 
	    	var arr = s.split(",");
	    	//alert(arr.length + " "+ arr[0]);
	    	var report = "被覆盖代码行用浅绿色表示\n未覆盖代码行用浅红色表示\n";
	    	var str = "<pre><font color='red' size='3'>"+report+"</font></pre>\n";
	    	str += "<pre><blockcode>";
	    	for(var i = 0; i < data.array.length; i++){
	    		if((isCover(i+1,arr)==true)){
	    			str += "<div style='background:#BBFFBB'>"+data.array[i] + "\n"+"</div>";	
	    		}else if((isCover(i+1,arr)==false)){
	    			str += "<div style='background:#FFB5B5'>"+data.array[i] + "\n"+"</div>";
	    		}else{
	    			str += "<div>"+data.array[i] + "\n"+"</div>";	
	    		}
	    		
	    	}
	    	str += "</blockcode></pre>";
	    	$("#codeDiv").html(str);
	    }
	    function isCover(num,arr){
	    	for(var i = 0; i < arr.length; i++){
		    	var a = arr[i].split("=");
		    	var n = a[0]-'0';
		    	n += 5;
		    	if(num == n){
		    		//alert(num+" "+ n);
		    		if(a[1] == "true"){
		    			return true;	
		    		}else{
		    	    	return false;
		    		}
		    	}	
	    	}
	    }
	    function hasNum(num,arr){
	    	for(var i = 0 ; i < arr.length; i++){
	    		if(num == arr[i]){
	    			return true;
	    		}
	    	}
	    	return false;
	    }
	    function deleteProblem(pid){
	    	layer.confirm('确定删除吗？', {
	    		btn: ['是','否'] //按钮
	    		}, function(){
	    			var myJSONObject = {
	    					"pid" : pid,
	    	    };
	    		var str = JSON.stringify(myJSONObject) ;
    	    	$.ajax({
    		        cache : false,
    		        type:'post',
    		        dataType:'json',
    		            url:'problem/delete',
    		            data:{jsonString:encodeURI(str)},
    		        success:function(data){
    		        	if(data.result == "success"){
    		        		layer.msg('删除成功!', {time: 1500,icon: 1});
    		        	}
    		        	initTable();
    		        }
    		    });
    		}, function(){		
	    		});	    	
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
                        <li ><a href="index.jsp">首页</a></li>
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
	<h2 class="page-title">提交记录</h2>
	
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
	<div class="row-fluid">
		<div class="block">
			<div id = "contentDiv">
        	</div>
		</div>
		<div class="block">
			<div id = "codeDiv">
			
        	</div>
		</div>
	</div>
	<div style="height:300px">
    		</div>
	</div>
	</div>
    </div>
    <div style="height:150px">
</div>
</div>
    <script src="js/bootstrap.js"></script>
  </body>
</html>