<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>随机程序格式-OJ出题管理系统</title>
    
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css">
    <link rel="stylesheet" type="text/css" href="css/theme.css">
    <link rel="stylesheet" href="css/font-awesome.css">

    <script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>

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
		        					随机程序格式与普通程序同样差别也不大,需要改动的只是输出(随机程序没有输入)
		        				</div>
		        			</li>
		        			<li>
		        				<div class="div1">
		        					将标准输出改为使用文件输出.&nbsp;&nbsp;&nbsp;并且&nbsp;,&nbsp;输出文件名分别为
		        					<font color='red' size='5px'>data.txt</font>!
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
#include &#60;iostream>
#include &#60;fstream>
#include &#60;ctime>
#include &#60;cstdlib>
using namespace std;
double random(double start, double end){
	return start+(end-start)*rand()/(RAND_MAX + 1.0);
}
int main(){
	freopen("data.txt","w",stdout);
	srand(time(0));
	int count=0;
	while(count&#60;30){
		int num1=(int)random(1,100);
		int num2=(int)random(1,100);
		int num3=(int)random(1,100);
		cout&#60;&#60;num1&#60;&#60;" "&#60;&#60;num2&#60;&#60;" "&#60;&#60;num3&#60;&#60;endl;
		cout&#60;&#60;"###"&#60;&#60;endl;//"###"为每一个测试样例的分隔符,由用户自己指定,注意不要与输出冲突
		count++;
	}
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
#include &#60;iostream>
#include &#60;fstream>
#include &#60;ctime>
#include &#60;cstdlib>
using namespace std;
double random(double start, double end){
	return start+(end-start)*rand()/(RAND_MAX + 1.0);
}
int main(){
	freopen("data.in","w",stdout);
	srand(time(0));
	int count=0;
	int size,target;
	while(count&#60;20){
		size=random(1,10);
		target=random(1,100);
		cout&#60;&#60;size&#60;&#60;" "&#60;&#60;target&#60;&#60;endl;
		for(int i=0; i&#60;size; i++){
			int num=random(1,100);
			cout&#60;&#60;num&#60;&#60;" ";
		}
		cout&#60;&#60;endl;
		cout&#60;&#60;"###"&#60;&#60;endl;
		count++;
	}
}
</blockcode>
</pre>
		    	</div>
			</div>
  </div>
</div>
<div style="height:100px">
</div>
</div>
    <script src="js/bootstrap.js"></script>
  </body>
</html>