<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>标程格式-OJ出题管理系统</title>
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
        .div1{
        	margin-top:20px;
        	font-size:16px;
        }
        #myTextArea{
        	background:transparent;
        	border:none;
        	resize:none;
        	font-size:17px;
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

                        <ul class="dropdown-menu">
                            <li><a tabindex="-1" href="#">账户设置</a></li>
                            <li class="divider"></li>
                            <li><a tabindex="-1" href="sign-in.html">登出</a></li>
                        </ul>
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
                  <li ><a href="sign-in.html">登录</a></li>
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
			<h2 class="page-title">标程格式</h2>
	
			<div class="row-fluid">
		    	<div class="block">
		        	<div style="font-family:'微软雅黑';font-size:15px">
		        		<ol>
		        			<li>
		        				<div class="div1">
		        					标程的格式与ACM标程大同小异,只是在输入输出上要做一些改变
		        				</div>
		        			</li>
		        			<li>
		        				<div class="div1">
		        					将标准输入输出改为使用文件输入输出.&nbsp;&nbsp;&nbsp;并且&nbsp;,&nbsp;输入输出文件名分别为
		        					<font color='red' size='5px'>in.txt,out.txt!</font>
		        				</div>
		        			</li>
		        			<li>
		        				<div class="div1">
		        					以下均以C++程序作为示例
		        				</div>
		        			</li>
		        			<li>
		        				<div class="div1">
		        					<a href="#trigle">示例1</a>
		        				</div>
		        			</li>
		        			<li>
		        				<div class="div1">
		        					<a href="#find_number">示例2</a>
		        				</div>
		        			</li>
		        		</ol>
		        	</div>
		    	</div>
			</div>
			<h3 id="trigle" class="page-title">判断三角形形状</h3>
			<div class="row-fluid">
		    	<div class="block">
		        	<pre>
		        	<blockcode>
#include &#60;iostream&#62;
#include &#60;fstream&#62;
using namespace std;
int main(){
	freopen("in.txt","r",stdin);
	freopen("out.txt","w",stdout);
	int a,b;
	int res=0;
	while(cin>>a>>b){
		if(a==0&&b==0){
			break;
		}
		res+=a*b;
	}
	cout&#60;&#60;res&#60;&#60;endl;
	return 0;
}
</blockcode>
</pre>
		    	</div>
			</div>
			
			<h3 id="find_number" class="page-title">Find Number</h3>
			<div class="row-fluid">
		    	<div class="block">
		        	<pre>
		        	<blockcode>
#include &#60;iostream&#62;
#include &#60;fstream&#62;
using namespace std;
int findNum(int a[],int len, int target){
	for(int i=0; i&#60;len; i++){
		if(a[i]==target){
			return i;
		}
	}
	return -1;
}
int main(){
	freopen("in.txt","r",stdin);
	freopen("out.txt","w",stdout);
	int size;
	cin&#62;&#62;size;
	int a[size];
	int target;
	cin&#62;&#62;target;
	for(int i=0; i&#60;size; i++){
		cin&#62;&#62;a[i];
	}
	cout&#60;&#60;findNum(a,size,target)&#60;&#60;endl;
	return 0 ;
}
</blockcode>
</pre>
		    	</div>
			</div>
	
    		<div style="height:300px">
    		</div>
  </div>
</div>
</div>
    <script src="lib/bootstrap/js/bootstrap.js"></script>
  </body>
</html>