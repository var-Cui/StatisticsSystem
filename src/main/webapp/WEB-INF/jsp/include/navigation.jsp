<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!-- 导航栏 -->
	<div class=" navbar-wrapper" style="box-sizing: border-box;" >

			<nav class="navbar navbar-inverse navbar-static-top">
					<div class="navbar-header" style="padding-left: 180px">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar"
							aria-expanded="false" aria-controls="navbar"></button>
						<a class="navbar-brand" href="${path}/welcome" style="font-size: 14px"><i class="iconfont">&#xe502</i>首页</a>
					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
                            <c:forEach var="firstMenu" items="${menuTree}" >
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                    aria-expanded="false">
                                        <i class="iconfont">${firstMenu.iconCls}</i> ${firstMenu.name} <span class="caret"></span>
                                    </a>
                                    <c:if test="${not empty firstMenu.children}">
                                        <ul class="dropdown-menu">
                                            <c:forEach var="secondMenu" items="${firstMenu.children}" >
                                                <li><a href="${path }${secondMenu.url}">${secondMenu.name}</a></li>
                                            </c:forEach>
                                        </ul>
                                    </c:if> 
                                </li>
                            </c:forEach>
						</ul>
						<ul class="nav navbar-nav navbar-right" style="padding-right: 100px">
			
			<!--  -->
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false"><span><i class="iconfont">&#xe61b</i></span><span><i class="iconfont">&#xe600</i></span></a>
							<ul class="dropdown-menu">
								<!-- <li><a href="#">修改信息</a></li> -->
								<li><a href="javascript:$('#logoutForm').submit();">注销</a></li>
							</ul>
							
							</li>
							
						</ul> 
					</div>
			</nav>

	</div>

	<form id="logoutForm" action="${path}/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
	</form>
	<!-- 导航栏 -->