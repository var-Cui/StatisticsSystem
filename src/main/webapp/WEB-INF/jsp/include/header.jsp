<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="">
<meta name="author" content="Eric gao">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="path" value="<%=path%>" />
<c:set var="basePath" value="<%=basePath%>" />
<link href="${path }/css/bootstrap3.3.7/bootstrap.min.css" rel="stylesheet">
<link href="${path }/css/bootstrap3.3.7/bootstrap-table.css" rel="stylesheet">
<link href="${path }/css/bootstrap3.3.7/bootstrapValidator.css" rel="stylesheet">
<link href="${path }/css/index.css" type="text/css" rel="stylesheet" />
<link href="${path }/css/font-awesome.min.css" rel="stylesheet"/>
<link href="${path }/css/style.css" rel="stylesheet"/>
<link href="${path }/css/iconfont.css"  rel="stylesheet"/>
<link href="${path }/layer/css/layui.css"  rel="stylesheet"/>
<script src="${path }/js/jquery/jquery.min.js" type="text/javascript"></script>
<script src="${path }/layer/layui.js" type="text/javascript"></script>
<script src="${path }/js/customJs/custom.js" type="text/javascript"></script>
<script src="${path }/js/customJs/moment.min.js" type="text/javascript"></script>
<script src="${path }/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script src="${path }/js/bootstrap/bootstrap-table.js" type="text/javascript"></script>
<script src="${path }/js/bootstrap/bootstrap-table-zh-CN.js" type="text/javascript"></script>
<script src="${path }/js/bootstrap/bootstrapValidator.js" type="text/javascript"></script>