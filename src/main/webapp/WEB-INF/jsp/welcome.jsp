<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<!-- 头部 -->
<%-- <%@include file="/WEB-INF/jsp/include/header.jsp"%> --%>
<!-- 头部 -->

<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      html,
      body {
        height: 100%;
      }

      body {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-align: center;
        align-items: center;
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #535a6c;
      }

      .form-signin {
        width: 100%;
        max-width: 330px;
        padding: 15px;
        margin: auto;
      }
      .form-signin .checkbox {
        font-weight: 400;
      }
      .form-signin .form-control {
        position: relative;
        box-sizing: border-box;
        height: auto;
        padding: 10px;
        font-size: 16px;
      }
      .form-signin .form-control:focus {
        z-index: 2;
      }
      .form-signin input[name="username"] {
        margin-bottom: -1px;
        border-bottom-right-radius: 0;
        border-bottom-left-radius: 0;
      }
      .form-signin input[name="password"] {
        margin-bottom: 10px;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
      }

      .form-signin p, .form-signin h1 { color:white; }

      .form-signin p{margin-top: 50px;}

      .error {color:red;}
</style>

<title>嘻嘻</title>
</head>
<body class="text-center">
    <form class="form-signin" action="${path }/login" method="post">
        <img class="mb-4" src="${path }/images/logo.png" alt="" width="136" height="49">
        <h1 class="h3 mb-3 font-weight-normal">请登录</h1>
        <label for="username" class="sr-only">用户名</label>
        <input type="text" id="username" name="username" class="form-control" placeholder="用户名" required="true" autofocus="true">
        <label for="password" class="sr-only">Password</label>
        <input type="password" id="password" name="password" class="form-control" placeholder="密码" required="true">
        <button class="btn btn-lg btn-primary btn-block" type="submit">登    录</button>
        <input type="hidden" name="_csrf" value="">
    </form>
</body>
</html>