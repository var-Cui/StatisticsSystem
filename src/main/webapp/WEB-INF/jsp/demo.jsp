<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<!-- 头部 -->
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<!-- 头部 -->
<c:set var="tableType" value="def"></c:set>
<title>化疗用药知识库</title>
<script type="text/javascript">
	$(function() {
		layui.use(['laydate', 'layer', 'upload'], function () {
				var laydate = layui.laydate;
				var layer = layui.layer;
				var upload = layui.upload;
		/* getData(); */
		//layer  日期插件
		laydate.render({
			elem : '#time'
		});
	});	});
	
	function queryParam(params) {
		var cancername = $("#cancername_btn").val().trim();
		return {
			pageNumber : this.pageNumber,
			pageSize : this.pageSize,
			searchText : cancername
		};
	}
	
	/* 获取data列表  数据绑定行 */
	function getData() {
		var url = "${path}/chemotherapy/getRptInfo";
		var columns = [ {
			checkbox : true,
			visible : true
		//是否显示复选框  
		}, {
			field : 'cancername',
			title : '癌种名称',
			align : 'center'
		}, {
			field : 'drugname',
			title : '药物名称',
			align : 'center'
		}, {
			field : 'author',
			title : '提交人',
			align : 'center'

		}, {
			field : 'time',
			title : '提交日期',
			align : 'center'
		},{
			field : 'id',
            title: '操作',
            align: 'center',
            valign:'middle',
            width:'100px',
            formatter:actionFormatter
        } ];
		
		initTable("detectionTable", url, columns);
	}
	
	//操作栏的格式化
    function actionFormatter(value, row, index) {
        var id = value;
        var result= "<a href='#' class='btn btn-xs green' data-toggle='modal' data-target='#myModal' onclick=\"editById('" +id + "',0)\" title='查看'><span class='glyphicon glyphicon-search'></span></a>";
         result += "<a href='#' class='btn btn-xs blue' data-toggle='modal' data-target='#myModal' onclick=\"editById('" +id + "',1)\" title='编辑'><span class='glyphicon glyphicon-pencil'></span></a>";
        result += "<a href='#' class='btn btn-xs red' onclick=\"deleteRpt('" + id + "')\" title='删除'><span class='glyphicon glyphicon-remove'></span></a>";
         return result;
    }
	
    function deleteRpt(id){
		var msg = "确定要删除吗？";
		if(confirm(msg) == true){
			$.ajax({
				url:"${path}/chemotherapy/chemotherapy/delRowInfo",
				type:"post",
				data:{id:id},
				success:function(data){
					layer.msg(data);
					$("#detectionTable").bootstrapTable('refresh',{url:'${path}/chemotherapy/getRptInfo'});
				}
			});
		}
	}
	
	//获取编辑DIV数据
	function editById(id,flag){
		$.ajax({
			url:"${path}/chemotherapy/chemotherapy/getEditPageInfo",
			type:"post",
			data:{id:id},
			success:function(returnJson){
				returnJson = JSON.parse(returnJson);
				if(returnJson.msg != "success"){
					layer.msg("查询失败");
				}
				var data  =returnJson.data;
				$("#id").val(data.id);
				$("#cancername").val(data.cancername);
				$("#drugname").val(data.drugname);
				$("#author").val(data.author);
				$("#time").val(data.time);
			}
		});
		attrChange(flag); 
	}
	
	function attrChange(flag){
		//查看
		if(flag == 0){
			$("#cancername").attr("readOnly","true");
			$("#drugname").attr("disabled","disabled");
			$("#author").attr("readOnly","true");
			$("#time").attr("readOnly","true");
			$("#myModalLabel").text("查看");	
			$("#updateInfo").css('visibility','hidden');	//隐藏保存按扭(修改)
			$("#saveInfo").css('visibility','hidden');		//隐藏保存按扭(添加)
		}else{
			$("#cancername").removeAttr("readOnly");
			$("#drugname").removeAttr("disabled");
			$("#author").removeAttr("readOnly");
			$("#time").removeAttr("readOnly");
			$("#updateInfo").attr('style','display:display');//显示保存按扭(修改)
			$("#saveInfo").attr('style','display:none');	 //隐藏保存按扭(添加)
			$("#myModalLabel").text("编辑");
			if(flag == 2){
				$("#id").val('');
				$("#cancername").val('');
				$("#drugname").val('');
				$("#author").val('');
				$("#time").val('');
				$("#myModalLabel").text("新增");
				$("#updateInfo").attr('style','display:none');	//隐藏保存按扭(修改)
				$("#saveInfo").attr('style','display:display');		//显示保存按扭(添加)
			}
		}
	}
	
	//保存新增
	function saveInfo(){
		var url = '${path}/chemotherapy/chemotherapy/saveInfo';
		var data =$('#updateInfoFrom').serializeObject();
		$.ajax({
			type : 'post',
			url : url,
			dataType : 'json',
			data: validatePageData(data, 'rcProjecttemplate'),
			contentType: "application/json;charset=UTF-8",
			success : function(data) {
				layer.msg(data);
				$("#closeDialog").click();
				$("#detectionTable").bootstrapTable('refresh',{url:'${path}/chemotherapy/getRptInfo',pageNumber:1});
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {}
		});
	}
	
	//保存修改
	function updateInfo(){
		var url = '${path}/chemotherapy/chemotherapy/updateInfo';
		var data =$('#updateInfoFrom').serializeObject();
		$.ajax({
			type : 'post',
			url : url,
			dataType : 'json',
			data: validatePageData(data, 'rcProjecttemplate'),
			contentType: "application/json;charset=UTF-8",
			success : function(data) {
				layer.msg(data);
				$("#closeDialog").click();
				$("#detectionTable").bootstrapTable('refresh',{url:'${path}/chemotherapy/getRptInfo'});
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {}
		});
	}

</script>
</head>
<body>
	<!-- 导航栏 -->
		<%@include file="/WEB-INF/jsp/include/navigation.jsp"%>
	<!-- 导航栏 -->
	<!-- 内容区 -->
		<div class="container marketing">
			<div class=" form-inline" style='margin-top:20px;'>
				<input type="text" id="cancername_btn" class="form-control col-xs-2" placeholder="请输入名称">
				<button onclick='getData();' class="btn btn-info glyphicon glyphicon-search" style='margin-left:5px; '></button>
				<button type='button' class='btn btn-info-top pull-right' style='margin-left: 20px' data-toggle='modal' data-target='#myModal' onclick="attrChange('2')">
					新增化疗用药知识库
				</button>
			</div>
			<table id="detectionTable" class=" table-striped" data-toolbar="#toolbar"> </table>
		</div>
		<div class="container marketing endPoint">
			<table id="detectionTable"class=" table-striped"  data-toolbar="#toolbar"> </table>
		</div>
		<!-- Modal -->
			<div class="modal fade" id="myModal" aria-hidden="true" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content" style="width: 1100px; margin-left: -250px">
						<div class="modal-header">
							<button
								type="button"
								class="close"
								data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">编辑</h4>
						</div>
						<div  style="margin-bottom: 15px;padding: 30px;height: 150px;">
							<form class="form-horizontal" action="#" method="post" id="updateInfoFrom">
								<!-- 隐藏表单域 -->
									<input type="hidden" id="id" name="id">
								<!-- 隐藏表单域 -->
								<table>
									<div class="col-sm-12 col-md-12">
										<div class="form-group">
											<label
													for="name_tem_2"
													class="col-sm-2 control-label normalLabel">癌种名称</label>
												<div class="col-sm-3">
													<input type="text" class="form-control" id="cancername" name="cancername" placeholder="癌种名称">
												</div>
										</div>
									</div> 
									<div class="col-sm-12 col-md-12">
											<div class="form-group">
												<label for="clinicalInfo_tem_2" class="col-sm-2 control-label normalLabel">药物名称</label>
												<div class="col-sm-8">
													<textarea class="form-control" id="drugname" name="drugname" placeholder="药物名称"></textarea>
													<!-- <input type="text" class="form-control" id="drugname" name="drugname" placeholder="药物名称"> -->
												</div>
											</div>
									</div>
									<!-- 中div -->
										<!-- <div class="col-sm-7 col-md-4">
											<div class="form-group">
												<label for="clinicalInfo_tem_2" class="col-sm-4 control-label normalLabel">药物名称</label>
												<div class="col-sm-8">
													<input type="text" class="form-control" id="drugname" name="drugname" placeholder="药物名称">
												</div>
											</div>
										</div> -->
									<!--  中div -->
									<!-- 右div -->
										<!-- <div class="col-sm-7 col-md-4">
											<div class="form-group">
												<label for="medicationHistory_tem_2" class="col-sm-4 control-label normalLabel">提交人</label>
												<div class="col-sm-8">
													<input type="text" class="form-control" id="author" name="author" placeholder="提交人">
												</div>
											</div>
										</div> -->
									<!-- 右div -->
								</table>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" onclick="updateInfo()" id="updateInfo">保存</button>
							<button type="button" class="btn btn-primary" onclick="saveInfo()" id="saveInfo">保存</button>
							<button type="button" class="btn btn-default" data-dismiss="modal" id="closeDialog">关闭</button>
						</div>
					</div>
				</div>
			</div>
		<!-- Modal -->
		
	<!-- 内容区 -->
	<!-- 尾部 -->
		<%@include file="/WEB-INF/jsp/include/footer.jsp"%>
	<!-- 尾部 -->
</body>
</html>

